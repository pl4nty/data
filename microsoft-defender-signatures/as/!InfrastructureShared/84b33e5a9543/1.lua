-- Threat: !InfrastructureShared
-- Name: 84b33e5a9543
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_0, 300) then
  if mp.IsTrustedFile(false) == true then
    return mp.CLEAN
  end
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
