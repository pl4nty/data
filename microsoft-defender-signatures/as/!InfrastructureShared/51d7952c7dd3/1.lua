-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51d7952c7dd3\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
if #l_0_3 < 50 then
  return mp.CLEAN
end
if #l_0_3 > 400 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = (MpCommon.StringRegExpSearch)("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|minimized)\\s+", l_0_3)
if not l_0_4 then
  return mp.CLEAN
end
do
  if not (string.match)(l_0_3, "[%-/][eE][ncodemaNCODEMA]*%s+\"?%s*([A-Za-z0-9/%+=]+)") then
    local l_0_6, l_0_7, l_0_9 = (string.match)(l_0_3, "–[eE][ncodemaNCODEMA]*%s+\"?%s*([A-Za-z0-9/%+=]+)")
  end
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R6 in 'UnsetPending'

  -- DECOMPILER ERROR at PC81: Confused about usage of register: R6 in 'UnsetPending'

  do
    if l_0_6 then
      local l_0_8 = nil
      if (MpCommon.Base64Decode)(l_0_6) then
        l_0_3 = l_0_3 .. (MpCommon.Base64Decode)(l_0_6)
      end
    end
    local l_0_10 = nil
    local l_0_11 = 0
    local l_0_12 = 0
    local l_0_13 = 0
    local l_0_14 = 0
    l_0_3:gsub("\"(.-)\"", function()
  -- function num : 0_0 , upvalues : l_0_11
  l_0_11 = l_0_11 + 1
end
)
    l_0_3:gsub("\'(.-)\'", function()
  -- function num : 0_1 , upvalues : l_0_12
  l_0_12 = l_0_12 + 1
end
)
    -- DECOMPILER ERROR at PC126: Overwrote pending register: R11 in 'AssignReg'

    local l_0_15 = nil
    local l_0_16 = l_0_11 + l_0_12 + l_0_13 + l_0_14 + 0
    if 5 <= l_0_16 then
      return mp.INFECTED
    end
    local l_0_17 = nil
    -- DECOMPILER ERROR at PC142: Overwrote pending register: R14 in 'AssignReg'

    if isnull(nil) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC153: Confused about usage of register: R14 in 'UnsetPending'

    local l_0_18 = (string.lower)((string.gsub)(nil, "[\"\'`^()+#&]", ""))
    if contains(l_0_18, {"iwr", "iex", "irm", "curl", "bitsadmin", "e:jscript", "downloadstring", "invoke-restmethod", "invoke-webrequest", "invoke-expression", "start-process"}) then
      return mp.INFECTED
    end
    return mp.INFECTED
  end
end

