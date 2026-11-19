-- Threat: !InfrastructureShared
-- Name: BaseConversions
-- Type: 1

function StrToBaseN(l_1_0, l_1_1)
  if not l_1_1 or l_1_1 == 10 then
    return tostring(l_1_0)
  end
  local l_1_2 = "0123456789abcdefghijklmnopqrstuvwxyz"
  local l_1_3 = {}
  local l_1_4 = table.insert
  repeat
    local l_1_5 = l_1_0 % l_1_1 + 1
    l_1_0 = l_1_0 / l_1_1
    l_1_4(l_1_3, 1, l_1_2:sub(l_1_5, l_1_5))
  until l_1_0 == 0
  return table.concat(l_1_3, "")
end
