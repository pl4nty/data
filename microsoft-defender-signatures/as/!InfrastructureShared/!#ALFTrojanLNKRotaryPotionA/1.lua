-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanLNKRotaryPotionA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetLnkInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC18: freeLocal<0 in 'ReleaseLocals'

if l_0_0.BasePath or "" ~= "" or l_0_0.RelativePath or "" == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

local l_0_4 = nil
-- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

if (string.find)((l_0_0.BasePath or "" ~= "" or l_0_0.RelativePath or ""):lower(), "\\system32\\ftp.exe", 1, true) == nil and (string.find)((l_0_0.BasePath or "" ~= "" or l_0_0.RelativePath or ""):lower(), "\\ftp.exe", 1, true) == nil then
  return mp.CLEAN
end
do
  do
    local l_0_5 = nil
    if l_0_4.Arguments or nil == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R2 in 'UnsetPending'

    if (string.find)(l_0_4.Arguments or nil, "-s\"\":_/%w/%w/%w") == nil then
      return mp.CLEAN
    end
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC69: freeLocal<0 in 'ReleaseLocals'

  end
end

