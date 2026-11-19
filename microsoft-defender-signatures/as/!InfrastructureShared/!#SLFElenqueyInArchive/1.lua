-- Threat: !InfrastructureShared
-- Name: !#SLF:ElenqueyInArchive
-- Type: 12

local l_0_0 = mp.getfilesize()
if 12288 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or string.len(l_0_1) < 10 then
  return mp.CLEAN
end
if l_0_2 == nil or string.len(l_0_2) < 5 then
  return mp.CLEAN
end
if string.find(l_0_2, "->", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2:sub(-4)
if l_0_3 == ".lnk" then
  local l_0_4 = {
    [".zip->"] = "%.zip%->.+",
    [".rar->"] = "%.rar%->.+",
    [".7z->"] = "%.7z%->.+",
    [".iso->"] = "%.iso%->.+",
    [".arj->"] = "%.arj%->.+",
    [".gz->"] = "%.gz%->.+",
    [".ace->"] = "%.ace%->.+",
    [".z->"] = "%.z%->.+",
    [".xz->"] = "%.xz%->.+"
  }
  for l_0_5, l_0_6 in pairs(l_0_4) do
    if string.find(l_0_2, l_0_5, 1, true) then
      mp.set_mpattribute("LUA:ElenqueyInArchive")
      local l_0_7 = string.match(l_0_2, l_0_6)
      if l_0_7 == nil or l_0_7:len() < 12 then
        return mp.CLEAN
      end
      local l_0_8 = l_0_5:len() + 1
      if l_0_8 + 5 >= l_0_7:len() then
        return mp.CLEAN
      end
      local l_0_9 = string.sub(l_0_7, l_0_8, -5)
      if l_0_9 == nil then
        return mp.CLEAN
      end
      local l_0_10 = l_0_9 .. l_0_5
      if string.find(l_0_2, l_0_10, 1, true) == nil then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
