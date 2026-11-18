-- Threat: Trojan:Script/Lampion.A
-- Type: 13
-- MpAttributes: SCPT:Script/CreateVbs.A & SCPT:Script/Shutdown.A & SCPT:Script/shell.A

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_1 and l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2)
    local l_0_4 = "%.zip.+%.vbs$"
    local l_0_5 = "%.zip.+%.vbe$"
    local l_0_6 = "%.zip.+%.js$"
    local l_0_7 = "%.zip.+%.jse$"
    if l_0_3:match(l_0_4) or l_0_3:match(l_0_5) or l_0_3:match(l_0_6) or l_0_3:match(l_0_7) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
