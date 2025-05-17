-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPowShellFormatobfusB\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0:find("psdeobfus-stg1", 1, true) or l_0_0:find("deobfus", 1, true) then
  if l_0_0:find("psdeobfus-stg2", 1, true) then
    return mp.CLEAN
  end
  escape_word = function(l_1_0)
  -- function num : 0_0
  local l_1_1, l_1_2 = l_1_0:gsub, l_1_0
  local l_1_3 = "[%(%)%.%%%+%-%*%?%[%]%^%$]"
  do
    local l_1_4 = function(l_2_0)
    -- function num : 0_0_0
    return "%" .. l_2_0
  end

    do return l_1_1(l_1_2, l_1_3, l_1_4) end
    -- DECOMPILER ERROR at PC5: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

  local l_0_1 = (mp.getfilesize)()
  if l_0_1 > 200000 then
    return mp.CLEAN
  end
  ;
  (mp.readprotection)(false)
  local l_0_2 = (mp.readfile)(0, l_0_1)
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  local l_0_3 = 0
  for l_0_7,l_0_8 in (string.gmatch)(l_0_2, "(\"{[%d{}]+}\")-f([\"%\'](.-)[\"%\'])[%)]") do
    local l_0_9 = l_0_7 .. "-f" .. l_0_8
    local l_0_10 = {}
    for l_0_14 in (string.gmatch)(l_0_7, "%d+") do
      (table.insert)(l_0_10, tonumber(l_0_14) + 1)
    end
    local l_0_15 = {}
    for l_0_19 in (string.gmatch)(l_0_8, "[\"%\'](.-)[\"%\']") do
      (table.insert)(l_0_15, l_0_19)
    end
    if #l_0_15 == #l_0_10 then
      local l_0_20 = nil
      for l_0_24,l_0_25 in ipairs(l_0_10) do
        local l_0_26 = l_0_15[l_0_25]
        l_0_20 = pcall(string.gsub, l_0_7, "{" .. l_0_25 - 1 .. "}", l_0_26)
      end
      if l_0_20 then
        l_0_3 = l_0_3 + 1
        l_0_9 = escape_word(l_0_9)
        l_0_2 = (string.gsub)(l_0_2, l_0_9, l_0_7)
      end
    end
  end
  -- DECOMPILER ERROR at PC143: Overwrote pending register: R7 in 'AssignReg'

  if l_0_3 >= 3 then
    (mp.vfo_add_buffer)(l_0_2, "[psdeobfus-stg2]", l_0_7.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

