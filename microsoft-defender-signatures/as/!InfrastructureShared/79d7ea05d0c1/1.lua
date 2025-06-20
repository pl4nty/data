-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\79d7ea05d0c1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = (mp.GetScannedPPID)()
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = ((mp.GetProcessCommandLine)(l_0_1)):lower()
  do
    if l_0_0.image_path ~= nil then
      local l_0_3 = (string.lower)(l_0_0.image_path)
      if l_0_3:match("([^\\]+)$") == "explorer.exe" then
        return mp.INFECTED
      end
    end
    do
      local l_0_4 = {}
      -- DECOMPILER ERROR at PC36: No list found for R3 , SetList fails

      -- DECOMPILER ERROR at PC37: Overwrote pending register: R4 in 'AssignReg'

      if not ("hidden")(l_0_2, l_0_4) then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
  end
end

