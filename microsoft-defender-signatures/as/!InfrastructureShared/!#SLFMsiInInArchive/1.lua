-- Threat: !InfrastructureShared
-- Name: !#SLF:MsiInInArchive
-- Type: 13

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or string.len(l_0_0) < 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "->", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0:sub(-4)
if l_0_1 == ".msi" then
  local l_0_2 = {
    [".zip->"] = "%.zip%->.+"
  }
  for l_0_3, l_0_4 in pairs(l_0_2) do
    if string.find(l_0_0, l_0_3, 1, true) then
      local l_0_5 = string.match(l_0_0, l_0_4)
      if l_0_5 == nil or l_0_5:len() < 12 then
        return mp.CLEAN
      end
      local l_0_6 = l_0_3:len() + 1
      if l_0_6 + 5 >= l_0_5:len() then
        return mp.CLEAN
      end
      local l_0_7 = string.sub(l_0_5, l_0_6, -5)
      if l_0_7 == nil then
        return mp.CLEAN
      end
      local l_0_8 = l_0_7 .. l_0_3
      if string.find(l_0_0, l_0_8, 1, true) == nil then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
