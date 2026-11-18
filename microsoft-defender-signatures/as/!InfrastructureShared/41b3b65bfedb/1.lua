-- Threat: !InfrastructureShared
-- Name: 41b3b65bfedb
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -12) == "iexplore.exe" and this_sigattrlog[1].matched then
  local l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
  if l_0_1 ~= nil then
    if l_0_1:sub(-1) == "\000" then
      l_0_1 = l_0_1:gsub("^(.-).$", "%1")
    end
    if string.sub(l_0_1, -4) == ".dll" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
