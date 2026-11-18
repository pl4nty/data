-- Threat: !InfrastructureShared
-- Name: 18d096a601c8
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 1048576 or 2097152 < l_0_0 then
  return mp.CLEAN
end
if not mp.get_mpattribute("AGGR:ScrFileExt.A") then
  return mp.CLEAN
end
if 811008 < l_0_0 then
  mp.readprotection(false)
  local l_0_1 = mp.readfile(811008, l_0_0)
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = tostring(l_0_1)
  if l_0_1:find("new ActiveXObject(\"WScript.Shell\")", 1, true) and l_0_1:find("split(\"", 1, true) and l_0_1:find(".join(\"\");", 1, true) and l_0_1:find("%.Run%([^)]-,%s*0,%s*false%)") then
    return mp.INFECTED
  end
end
return mp.CLEAN
