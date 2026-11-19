-- Threat: \x84!SQLAMSIPOC.A
-- Type: 13
-- MpAttributes: Sigattr:SQLAMSIPOC

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if l_0_1 and l_0_2 == "SQL Server AMSI Agent" then
  return mp.INFECTED
end
return mp.CLEAN
