-- Threat: !InfrastructureShared
-- Name: 76417aae9345
-- Type: 21

if mp.getfilesize() > 25360 or peattributes.ismsil ~= true then
  return mp.CLEAN
end
local l_0_0 = pe.get_versioninfo().FileDescription
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 == "vshost64-clr3" or l_0_0 == "vshost64-clr2" or l_0_0 == "vshost32-clr3" or l_0_0 == "vshost32-clr2" or l_0_0 == ".NET Framework" or l_0_0 == "XML Protector" or l_0_0 == "Microsoft" then
  return mp.INFECTED
end
return mp.LOWFI
