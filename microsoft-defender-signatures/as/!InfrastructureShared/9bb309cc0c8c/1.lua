-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9bb309cc0c8c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
  l_0_3 = (string.lower)((this_sigattrlog[2]).utf8p2)
end
if l_0_3 == "" or l_0_3 == nil or #l_0_3 > 150 or (string.find)(l_0_3, "github.com", 1, true) then
  return mp.CLEAN
end
local l_0_4 = " " .. l_0_3 .. " "
do
  if not l_0_4:match("%s%-%a*o%s+(%S+)") then
    local l_0_5, l_0_6 = l_0_4:match("%s%-%-output[%s=]+(%S+)")
  end
  -- DECOMPILER ERROR at PC81: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC83: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC85: Confused about usage of register: R5 in 'UnsetPending'

  do
    if l_0_5 ~= nil and l_0_5 ~= "" then
      local l_0_7, l_0_8 = l_0_5:gsub("[\"\']", "")
      if l_0_7 ~= "-" and l_0_7 ~= "/dev/stdout" and l_0_7 ~= "/dev/fd/1" then
        l_0_8 = mp
        l_0_8 = l_0_8.CLEAN
        return l_0_8
      end
    end
    for l_0_12,l_0_13,l_0_14 in l_0_3:gmatch("https?://[%w%.%-:]+/(%w+)/(%w+)()") do
      local l_0_9 = nil
      -- DECOMPILER ERROR at PC131: Confused about usage of register: R11 in 'UnsetPending'

      if #l_0_13 >= 4 and #l_0_13 <= 8 and l_0_13:match("^[%l%d]+$") and #l_0_14 >= 10 and #l_0_14 <= 16 and l_0_14:find("%d") and l_0_14:find("%a") and not (l_0_3:sub(R11_PC131, R11_PC131)):match("[/%.%w_%-%?#=&]") then
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

