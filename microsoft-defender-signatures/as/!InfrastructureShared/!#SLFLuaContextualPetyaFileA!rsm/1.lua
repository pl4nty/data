-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:ContextualPetyaFile.A!rsm
-- Type: 9

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
  return mp.CLEAN
end
if not peattributes.isdll and peattributes.no_exports then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= "perfc.dat" then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pe.get_exports()
if 1 < l_0_1 then
  return mp.CLEAN
end
if l_0_1 == 0 then
  return mp.INFECTED
end
if l_0_2[1].ordinal ~= 1 then
  return mp.CLEAN
end
return mp.INFECTED
