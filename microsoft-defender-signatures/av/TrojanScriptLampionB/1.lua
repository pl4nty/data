-- Threat: Trojan:Script/Lampion.B
-- Type: 13
-- MpAttributes: SCPT:Script/RegRun.AA & SCPT:Script/Rundll.AB

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_1 and l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2)
    if string.find(l_0_3, "\\appdata\\local\\temp\\", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
