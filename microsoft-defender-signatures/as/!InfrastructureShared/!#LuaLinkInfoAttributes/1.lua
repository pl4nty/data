-- Threat: !InfrastructureShared
-- Name: !#Lua:LinkInfoAttributes
-- Type: 12
-- MpAttributes: BM_LNK_FILE

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if string.sub(r0_0, -25) == "\\microsoft\\windows\\recent" then
  return mp.CLEAN
end
local r0_1 = mp.GetLnkInfo()
if r0_1 == nil then
  return mp.CLEAN
end

local function r0_2(p1_0)
  local r1_0 = {}
  p1_0 = p1_0:gsub("\\+$", "")
  for r1_1 in string.gmatch(p1_0, "[^\\]+") do
    table.insert(r1_0, r1_1)
  end
  local r1_2 = {}
  local r1_3 = #r1_0
  local r1_4 = r1_0[r1_3] and r1_0[r1_3]:find("%.")
  if r1_4 then
    r1_2.filename = r1_0[r1_3]
    r1_3 = r1_3 - 1
  end
  r1_2.folder_count = r1_0[1] and r1_0[1]:match("^[A-Za-z]:$") and r1_3 - 1 or r1_3
  local r1_5 = r1_3 < 5 and r1_3 or 5
  for r1_6 = 0, r1_5 - 1 do
    r1_2["last_folder" .. r1_6] = r1_0[r1_3 - r1_6]
  end
  return r1_2
end

local r0_3 = r0_1.BasePath
if r0_3 ~= nil and #r0_3 > 1 then
  local r0_4 = string.lower(r0_3)
  local r0_5 = r0_4
  local r0_6 = r0_5:gsub("%s", "/x20")
  r0_4 = r0_6
  r0_5 = r0_4
  r0_6 = r0_5:gsub("%(", "/x28")
  r0_4 = r0_6
  r0_5 = r0_4
  r0_6 = r0_5:gsub("%)", "/x29")
  r0_4 = r0_6
  r0_6 = r0_2
  r0_5 = r0_4
  r0_6 = r0_6(r0_5)
  if r0_6 ~= nil then
    if r0_6.filename ~= nil then
      local r0_7 = r0_6.filename
      if #r0_7 > 40 then
        r0_7 = string.sub(r0_7, 1, 40)
      end
      mp.set_mpattribute(string.format("Lua:LnkTargetFname!%s", r0_7))
      local r0_8 = r0_7:match("%.(.+)$")
      if r0_8 then
        mp.set_mpattribute(string.format("Lua:LnkTargetFnameExt!%s", r0_8))
      end
    end
    if r0_6.folder_count ~= nil and r0_6.folder_count >= 1 then
      local r0_9 = r0_6.folder_count
      mp.set_mpattribute(string.format("Lua:LnkTargetLastFolderCount!%s", tostring(r0_9)))
      for r0_10 = 0, 4 do
        local r0_11 = r0_6["last_folder" .. r0_10]
        if r0_11 then
          mp.set_mpattribute(string.format("Lua:LnkTargetLastFolder%s!%s", tostring(r0_10),
              tostring(r0_11)))
        end
      end
    end
  end
end
return mp.CLEAN
