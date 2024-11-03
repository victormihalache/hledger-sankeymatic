#!/bin/sh

awk -F '","' 'NR>3 {
  account = $1
  gsub(/"/, "", account);

  amount = $2
  gsub(/[^0-9.,]/, "", amount);

  account = "Budget:" account
  subaccounts_count = split(account, subaccounts, ":");

  for (i = subaccounts_count; i > 1; i--) {
    if (account ~ /^Budget:Expenses/) {
      # We are after the "Expenses" marker

      expenses_subaccounts[subaccounts[i-1]] = 1
      expenses_subaccounts[subaccounts[i]] = 1

      expenses_flows[subaccounts[i-1] ":" subaccounts[i]] += amount
    } else {
      # We are before the "Expenses" marker

      revenues_subaccounts[subaccounts[i]] = 1
      revenues_subaccounts[subaccounts[i-1]] = 1

      revenues_flows[subaccounts[i] ":" subaccounts[i-1]] += amount
    }
  }
} END {
  for (flow in expenses_flows) {
    split(flow, subaccounts, ":")

    source = subaccounts[1]
    destination = subaccounts[2]

    print source, "[" expenses_flows[flow] "]", destination
  }

  for (flow in revenues_flows) {
    split(flow, subaccounts, ":")

    source = subaccounts[1]
    destination = subaccounts[2]

    if (source != "Budget" && destination != "Budget") {
      if (source in expenses_subaccounts) {
        source = source " (r)"
      } else if (destination in expenses_subaccounts) {
        destination = destination " (r)"
      }
    }

    print source, "[" revenues_flows[flow] "]", destination
  }
}'
