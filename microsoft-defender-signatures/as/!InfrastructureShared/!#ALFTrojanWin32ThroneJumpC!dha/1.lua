-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/ThroneJump.C!dha
-- Type: 10

local l_0_0 = 1
if pehdr.NumberOfSections > 4 and pehdr.NumberOfSections < 20 then
  while l_0_0 < pehdr.NumberOfSections + 1 do
    if pesecs[l_0_0].Name == ".detourc" then
      local l_0_1 = 1
      while l_0_1 < pehdr.NumberOfSections + 1 do
        if pesecs[l_0_1].Name == ".v-lizer" then
          return mp.INFECTED
        end
        l_0_1 = l_0_1 + 1
      end
    end
    l_0_0 = l_0_0 + 1
  end
end
return mp.CLEAN
