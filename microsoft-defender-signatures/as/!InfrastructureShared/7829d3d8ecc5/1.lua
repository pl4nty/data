-- Threat: !InfrastructureShared
-- Name: 7829d3d8ecc5
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil then
  return mp.CLEAN
end
if 4000000 < l_0_0 and l_0_0 < 7000000 then
  mp.readprotection(false)
  local l_0_1 = mp.readfile(0, 20)
  mp.readprotection(true)
  if l_0_1 == nil or #l_0_1 == 0 or #l_0_1 ~= 20 then
    return mp.CLEAN
  end
  if string.find(l_0_1, "/f/f/f/f", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
