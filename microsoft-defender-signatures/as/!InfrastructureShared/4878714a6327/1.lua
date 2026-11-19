-- Threat: !InfrastructureShared
-- Name: 4878714a6327
-- Type: 21

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = {
  "autohotkey",
  "autohotkeysc%.bin",
  "ahk2exe%.exe",
  "infomisc%.exe",
  "uninst%.exe",
  "au3_spy%.exe",
  "andy[%w]+%.exe",
  "setup%.exe",
  "traymenu%.exe",
  "volhotkey%.exe"
}
for l_0_3 = 1, #l_0_2 do
  if l_0_1:find(l_0_2[l_0_3]) ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
