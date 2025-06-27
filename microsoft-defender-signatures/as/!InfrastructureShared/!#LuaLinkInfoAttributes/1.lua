-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaLinkInfoAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if (string.sub)(l_0_0, -25) == "\\microsoft\\windows\\recent" then
  return mp.CLEAN
end
local l_0_1 = (mp.GetLnkInfo)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  l_1_0 = l_1_0:gsub("\\+$", "")
  for l_1_5 in (string.gmatch)(l_1_0, "[^\\]+") do
    (table.insert)(l_1_1, l_1_5)
  end
  local l_1_6 = {}
  local l_1_7 = #l_1_1
  do
    if l_1_1[l_1_7] then
      local l_1_8, l_1_9, l_1_11, l_1_14, l_1_17 = (l_1_1[l_1_7]):find("%.")
    end
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R4 in 'UnsetPending'

    if l_1_8 then
      l_1_6.filename = l_1_1[l_1_7]
      l_1_7 = l_1_7 - 1
    end
    do
      if l_1_1[1] then
        local l_1_10, l_1_12, l_1_15, l_1_18 = , (l_1_1[1]):match("^[A-Za-z]:$")
      end
      -- DECOMPILER ERROR at PC40: Confused about usage of register: R5 in 'UnsetPending'

      l_1_6.folder_count = l_1_12 and l_1_7 - 1 or l_1_7
      for l_1_23 = 0, (l_1_7 < 5 and l_1_7 or 5) - 1 do
        local l_1_20, l_1_21, l_1_22 = nil
        -- DECOMPILER ERROR at PC57: Confused about usage of register: R10 in 'UnsetPending'

        l_1_6["last_folder" .. R10_PC57] = l_1_1[l_1_7 - R10_PC57]
      end
      return l_1_6
    end
  end
end

local l_0_3 = l_0_1.BasePath
if l_0_3 ~= nil and #l_0_3 > 1 then
  l_0_3 = (string.lower)(l_0_3)
  l_0_3 = l_0_3:gsub("%s", "/x20")
  l_0_3 = l_0_3:gsub("%(", "/x28")
  l_0_3 = l_0_3:gsub("%)", "/x29")
  local l_0_4 = l_0_2(l_0_3)
  if l_0_4 ~= nil then
    do
      if l_0_4.filename ~= nil then
        local l_0_5 = l_0_4.filename
        if #l_0_5 > 40 then
          l_0_5 = (string.sub)(l_0_5, 1, 40)
        end
        ;
        (mp.set_mpattribute)((string.format)("Lua:LnkTargetFname!%s", l_0_5))
      end
      if l_0_4.folder_count ~= nil and l_0_4.folder_count >= 1 then
        local l_0_6 = l_0_4.folder_count
        ;
        (mp.set_mpattribute)((string.format)("Lua:LnkTargetLastFolderCount!%s", tostring(l_0_6)))
        for l_0_10 = 0, 4 do
          local l_0_11 = l_0_4["last_folder" .. l_0_10]
          if l_0_11 then
            (mp.set_mpattribute)((string.format)("Lua:LnkTargetLastFolder%s!%s", tostring(l_0_10), tostring(l_0_11)))
          end
        end
      end
      do
        return mp.CLEAN
      end
    end
  end
end

