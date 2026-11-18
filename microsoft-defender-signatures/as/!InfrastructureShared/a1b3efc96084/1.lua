-- Threat: !InfrastructureShared
-- Name: a1b3efc96084
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0) or l_0_0
l_0_0 = string.lower(l_0_0)
if l_0_0:find("\\windows\\system32\\", 1, true) or l_0_0:find("\\windows\\syswow64\\", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("\\appdata\\", 1, true) or l_0_0:find("\\programdata\\", 1, true) or l_0_0:find("\\users\\public\\", 1, true) or l_0_0:find("\\temp\\", 1, true) or l_0_0:find("\\downloads\\", 1, true) or l_0_0:find("\\desktop\\", 1, true) then
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
