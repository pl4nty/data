-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a5d7888e6458\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) and not isnull(l_0_0.ppid) and (string.find)(l_0_0.image_path, "/node", 1, true) then
  local l_0_1 = {}
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC31: No list found for R2 , SetList fails

  local l_0_3 = {}
  -- DECOMPILER ERROR at PC33: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC35: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC36: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC39: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R5 in 'AssignReg'

  l_0_2 = l_0_2(l_0_3, "node npm-cli.js", "npm install")
  if l_0_2 then
    l_0_2 = mp
    l_0_2 = l_0_2.INFECTED
    return l_0_2
  end
end
do
  return mp.CLEAN
end

