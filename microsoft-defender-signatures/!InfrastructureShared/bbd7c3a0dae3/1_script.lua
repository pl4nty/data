-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bbd7c3a0dae3\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
local l_0_3 = {}
-- DECOMPILER ERROR at PC28: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC29: Overwrote pending register: R4 in 'AssignReg'

if not ("http")(l_0_2, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = (mp.GetParentProcInfo)()
if l_0_4 ~= nil and l_0_4.image_path ~= nil then
  local l_0_5 = (string.lower)(l_0_4.image_path)
  local l_0_6 = l_0_5:match("([^\\]+)$")
  local l_0_7 = {}
  l_0_7["explorer.exe"] = true
  if l_0_7[l_0_6] then
    return mp.INFECTED
  end
end
do
  return mp.LOWFI
end

