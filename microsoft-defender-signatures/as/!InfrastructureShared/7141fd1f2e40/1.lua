-- Threat: !InfrastructureShared
-- Name: 7141fd1f2e40
-- Type: 21

if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if mp.getfilesize() > 6144 or peattributes.ismsil ~= true then
  return mp.CLEAN
end
local l_0_0 = pe.get_versioninfo().FileVersion
local l_0_1 = pe.get_versioninfo().ProductVersion
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if l_0_0 == "0.0.0.0" and l_0_1 == "0.0.0.0" then
  return mp.LOWFI
end
return mp.CLEAN
