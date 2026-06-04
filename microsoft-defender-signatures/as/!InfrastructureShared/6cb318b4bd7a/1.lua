-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb318b4bd7a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 and l_0_0.image_path and (l_0_0.image_path):match("([^\\]+)$") ~= "node.exe" then
  return mp.CLEAN
end
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
do
  if l_0_1 and l_0_1.image_path then
    local l_0_2 = (l_0_1.image_path):match("([^\\]+)$")
    if l_0_2 ~= "node.exe" and l_0_2 ~= "npm.exe" then
      return mp.CLEAN
    end
  end
  do
    local l_0_3 = nil
    if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
      l_0_3 = (this_sigattrlog[1]).utf8p2
    end
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
      l_0_3 = (this_sigattrlog[2]).utf8p2
    end
    if l_0_3 then
      local l_0_4 = contains
      local l_0_5 = l_0_3
      local l_0_6 = {}
      -- DECOMPILER ERROR at PC81: No list found for R5 , SetList fails

    end
    -- DECOMPILER ERROR at PC85: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC86: Overwrote pending register: R3 in 'AssignReg'

    if not l_0_4 then
      return l_0_4
    end
    -- DECOMPILER ERROR at PC88: Overwrote pending register: R3 in 'AssignReg'

    l_0_4()
    -- DECOMPILER ERROR at PC90: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC91: Overwrote pending register: R3 in 'AssignReg'

    do return l_0_4 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

