-- Threat: !InfrastructureShared
-- Name: !#FOPEX:VirTool:Win32/Obfuscator.PN.exhaust
-- Type: 8

local l_0_0 = {
  809071406,
  1667851054,
  1685024046,
  1701145134,
  1701409838,
  1701736238,
  1768453166,
  1768912430,
  1818321710,
  1865511726,
  1918987566,
  1919253038,
  1919905838
}

function binary_search(l_1_0, l_1_1)
  local l_1_2 = 1
  local l_1_3 = #l_1_0
  while l_1_2 <= l_1_3 do
    local l_1_4 = (l_1_3 + l_1_2) / 2
    if l_1_1 < l_1_0[l_1_4] then
      l_1_3 = l_1_4 - 1
    elseif l_1_1 > l_1_0[l_1_4] then
      l_1_2 = l_1_4 + 1
    else
      return l_1_4
    end
  end
  return 0
end

if pehdr.NumberOfSections >= 7 and pehdr.NumberOfSections <= 11 and binary_search(l_0_0, pesecs[2].NameDW) ~= 0 then
  return mp.INFECTED
end
if pehdr.NumberOfSections >= 12 and pehdr.NumberOfSections <= 15 and binary_search(l_0_0, pesecs[3].NameDW) ~= 0 then
  return mp.INFECTED
end
return mp.CLEAN
