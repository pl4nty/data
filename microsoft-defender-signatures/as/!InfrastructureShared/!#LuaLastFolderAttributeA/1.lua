-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaLastFolderAttributeA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
l_0_0 = l_0_0:gsub("\\", "/")
if #l_0_0 > 1 and (string.sub)(l_0_0, -1) == "/" then
  l_0_0 = (string.sub)(l_0_0, 1, -2)
end
local l_0_1, l_0_2 = (string.gsub)(l_0_0, "/", "")
do
  if (string.sub)(l_0_0, 1, 1) == "/" then
    local l_0_3, l_0_4 = l_0_2 - 1
  end
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC58: Confused about usage of register: R3 in 'UnsetPending'

  if l_0_3 < 0 or l_0_3 >= 18 then
    return mp.CLEAN
  end
  local l_0_5 = nil
  local l_0_6 = nil
  if l_0_5 == 0 and l_0_0 == "/" then
    (mp.set_mpattribute)(l_0_6 .. "0!/")
    ;
    (mp.set_mpattribute)((string.format)("%sCount!%s", "Lua:LastFolder", tostring(l_0_5)))
    return mp.CLEAN
  end
  local l_0_7 = nil
  for l_0_11 in (string.gmatch)(l_0_0, "[^/]+") do
    local l_0_8 = {}
    -- DECOMPILER ERROR at PC96: Confused about usage of register: R10 in 'UnsetPending'

    R10_PC96 = R10_PC96:gsub("%s", "/x20")
    R10_PC96 = R10_PC96:gsub("%(", "/x28")
    R10_PC96 = R10_PC96:gsub("%)", "/x29")
    l_0_8[#l_0_8 + 1] = R10_PC96
  end
  local l_0_12 = nil
  local l_0_13 = false
  for l_0_17,l_0_18 in ipairs(l_0_12) do
    local l_0_14 = #l_0_12
    -- DECOMPILER ERROR at PC125: Confused about usage of register: R14 in 'UnsetPending'

    if l_0_14 - l_0_18 >= 0 and l_0_14 - l_0_18 <= 5 and #l_0_19 >= 1 then
      l_0_13 = true
      -- DECOMPILER ERROR at PC136: Confused about usage of register: R14 in 'UnsetPending'

      local l_0_20 = nil
      local l_0_21 = nil
      -- DECOMPILER ERROR at PC147: Confused about usage of register: R16 in 'UnsetPending'

      if #(string.format)("%s%s!", l_0_6, tostring(l_0_14 - l_0_18)) .. l_0_19 <= 63 then
        (mp.set_mpattribute)((string.format)("%s%s!", l_0_6, tostring(l_0_14 - l_0_18)) .. l_0_19)
      else
        -- DECOMPILER ERROR at PC152: Confused about usage of register: R16 in 'UnsetPending'

        ;
        (mp.set_mpattribute)(((string.format)("%s%s!", l_0_6, tostring(l_0_14 - l_0_18)) .. l_0_19):sub(1, 63))
        ;
        (mp.set_mpattribute)(l_0_21 .. ":longfolder")
      end
    end
  end
  if l_0_13 == true then
    (mp.set_mpattribute)(l_0_7)
  end
  return mp.CLEAN
end

