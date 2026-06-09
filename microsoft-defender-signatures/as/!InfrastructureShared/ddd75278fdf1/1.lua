-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ddd75278fdf1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
local l_0_2 = (string.lower)(l_0_0.image_path)
if l_0_2:match("([^\\]+)$") ~= "powershell.exe" then
  return mp.CLEAN
end
do
  do
    if l_0_1 ~= nil then
      local l_0_3 = {}
      -- DECOMPILER ERROR at PC31: No list found for R3 , SetList fails

      -- DECOMPILER ERROR at PC32: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC33: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC34: Overwrote pending register: R6 in 'AssignReg'

      if ("invoke-webrequest")("invoke-expression", "| invoke-expression") then
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

