-- Threat: !InfrastructureShared
-- Name: !#LUA:ContextualDubiousExeFileName.A
-- Type: 9

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 or 5242880 < l_0_0 then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = {
    ["2014"] = true,
    deutschland = true,
    dezember = true,
    informationen = true,
    kontobewegung = true,
    november = true,
    online = true,
    order = true,
    purchase = true,
    rechnung = true,
    team = true,
    telekom = true,
    transaktions = true,
    vodafone = true
  }
  local l_0_2 = 0
  local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  for l_0_4 in string.gmatch(l_0_3, "%w+") do
    if l_0_1[l_0_4] then
      l_0_2 = l_0_2 + 1
    end
  end
  if 2 <= l_0_2 then
    return mp.LOWFI
  end
end
return mp.CLEAN
