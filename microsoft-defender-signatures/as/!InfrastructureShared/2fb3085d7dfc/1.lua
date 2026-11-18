-- Threat: !InfrastructureShared
-- Name: 2fb3085d7dfc
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if string.find(l_0_0, ".downloadstring", 1, true) ~= nil or string.find(l_0_0, ".downloadfile", 1, true) ~= nil then
    return mp.INFECTED
  end
  if string.find(l_0_0, ".streamreader", 1, true) ~= nil and string.find(l_0_0, ".deflatestream", 1, true) ~= nil and string.find(l_0_0, "base64", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
