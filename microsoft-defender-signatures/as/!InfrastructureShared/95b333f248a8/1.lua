-- Threat: !InfrastructureShared
-- Name: 95b333f248a8
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0, -20))
  if l_0_1 ~= "\\umworkerprocess.exe" then
    return mp.CLEAN
  end
  local l_0_2
  if this_sigattrlog[1].matched then
    l_0_2 = this_sigattrlog[1].utf8p1
  elseif this_sigattrlog[2].matched then
    l_0_2 = this_sigattrlog[2].utf8p1
  end
  if l_0_2 ~= nil and sysio.IsFileExists(l_0_2) then
    bm.add_threat_file(l_0_2)
  end
  return mp.INFECTED
end
return mp.CLEAN
