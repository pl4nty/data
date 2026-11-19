-- Threat: !InfrastructureShared
-- Name: !#SLF:SuspExecInArchive
-- Type: 12
-- MpAttributes: !RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if 4194304 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or string.len(l_0_1) < 25 then
  return mp.CLEAN
end
if l_0_2 == nil or string.len(l_0_2) < 15 then
  return mp.CLEAN
end
local l_0_3 = l_0_2:sub(-4)
local l_0_4 = l_0_2:sub(-3)
local l_0_5 = {
  [".jse"] = true,
  [".vbs"] = true,
  [".wsf"] = true,
  [".vbe"] = true,
  [".hta"] = true,
  [".mht"] = true,
  [".bat"] = true,
  [".ps1"] = true,
  [".cmd"] = true,
  [".url"] = true,
  [".jar"] = true,
  [".lnk"] = true,
  [".exe"] = true,
  [".scr"] = true,
  [".pif"] = true,
  [".docx"] = true,
  [".xlsx"] = true,
  [".doc"] = true,
  [".xls"] = true,
  [".rtf"] = true,
  docm = true,
  xlsm = true,
  ppam = true,
  pptm = true,
  ppsm = true,
  potm = true,
  [".js"] = true
}
if l_0_5[l_0_3] == true or l_0_5[l_0_4] == true then
  local l_0_6 = {
    [".zip)->"] = "%.zip%)%->.+",
    [".rar)->"] = "%.rar%)%->.+",
    [".7z)->"] = "%.7z%)%->.+",
    [".iso)->"] = "%.iso%)%->.+",
    [".arj)->"] = "%.arj%)%->.+",
    [".gz)->"] = "%.gz%)%->.+",
    [".ace)->"] = "%.ace%)%->.+",
    [".z)->"] = "%.z%)%->.+",
    [".xz)->"] = "%.xz%)%->.+",
    [".bz)->"] = "%.bz%)%->.+",
    [".rev)->"] = "%.rev%)%->.+",
    [".r00)->"] = "%.r00%)%->.+"
  }
  for l_0_7, l_0_8 in pairs(l_0_6) do
    if string.find(l_0_2, l_0_7, 1, true) then
      local l_0_9 = string.match(l_0_2, l_0_8)
      if l_0_9 == nil or l_0_9:len() < 12 then
        return mp.CLEAN
      end
      local l_0_10 = l_0_7:len() + 1
      if l_0_10 + 5 >= l_0_9:len() then
        return mp.CLEAN
      end
      local l_0_11 = string.sub(l_0_9, l_0_10, -5)
      if l_0_11 == nil then
        return mp.CLEAN
      end
      local l_0_12 = l_0_11 .. l_0_7
      if string.find(l_0_2, l_0_12, 1, true) == nil then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
