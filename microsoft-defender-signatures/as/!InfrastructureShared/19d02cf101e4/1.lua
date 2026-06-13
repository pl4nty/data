-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19d02cf101e4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 ~= nil then
  l_0_0 = (string.lower)(l_0_0)
else
  return mp.CLEAN
end
local l_0_1 = (string.find)(l_0_0, ".3mf->metadata/project_settings.config", 1, true)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = 131072
local l_0_3 = (mp.getfilesize)()
if l_0_3 < l_0_2 then
  l_0_2 = l_0_3
end
;
(mp.readprotection)(false)
local l_0_4 = (mp.readfile)(0, l_0_2)
;
(mp.readprotection)(true)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5, l_0_6 = pcall(safeJsonDeserialize, tostring(l_0_4))
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_7 = tostring(l_0_6.post_process)
if l_0_7 == nil then
  return mp.CLEAN
else
  l_0_7 = (string.lower)(l_0_7)
end
do
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC103: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R10 in 'AssignReg'

  for l_0_12,l_0_13 in ("powershell")("pwsh") do
    -- DECOMPILER ERROR at PC108: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC110: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC111: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC112: Overwrote pending register: R17 in 'AssignReg'

    if (("mshta").find)("rundll32", "regsvr32", "certutil", true) ~= nil then
      set_research_data("post_process", l_0_7, false)
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

