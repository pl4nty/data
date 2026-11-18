-- Threat: !InfrastructureShared
-- Name: 428c5f1df633
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 8388608 or 17825792 < l_0_0 then
  return mp.CLEAN
end
if mp.get_mpattribute("HSTR:PYINSTALLER") and mp.get_mpattribute("HSTR:Linux/NativeAPIDirectoryEnumuerate.A") then
  return mp.INFECTED
end
return mp.CLEAN
