-- Threat: !InfrastructureShared
-- Name: !#Lua:PhantomEvasion!system
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & (HSTR:Win32/PhantomEvasion.A | HSTR:Win64/PhantomEvasion.A)

if peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 1048576 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.query_import
if 0 == l_0_1(pe.IMPORT_STATIC, 1962618287) then
  return mp.CLEAN
end
if 0 == l_0_1(pe.IMPORT_STATIC, 2775632208) then
  return mp.CLEAN
end
return mp.INFECTED
