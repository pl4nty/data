-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:UEFI/Ifeu.A
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_UEFISTREAM then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = {
  "cef5b9a3-476d-497f-9fdc-e98143e0422c",
  "fff12b8d-7696-4c8b-a985-2747075b4f50"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
