-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6dd7ad092bc4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if not (string.find)(l_0_1, "ilasm", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
do
  if l_0_2 and l_0_2.image_path then
    local l_0_3 = (string.lower)(l_0_2.image_path)
    if (string.find)(l_0_3, "\\msbuild.exe", 1, true) or (string.find)(l_0_3, "\\devenv.exe", 1, true) or (string.find)(l_0_3, "\\dotnet.exe", 1, true) or (string.find)(l_0_3, "\\visual studio\\", 1, true) or (string.find)(l_0_3, "\\jetbrains\\", 1, true) or (string.find)(l_0_3, "\\rider\\", 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_4 = false
  if l_0_2 and l_0_2.image_path then
    local l_0_5 = (string.lower)(l_0_2.image_path)
    local l_0_6 = {}
    -- DECOMPILER ERROR at PC129: No list found for R5 , SetList fails

    -- DECOMPILER ERROR at PC130: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC131: Overwrote pending register: R7 in 'AssignReg'

    for l_0_10,l_0_11 in ("\\powershell.exe")("\\pwsh.exe") do
      -- DECOMPILER ERROR at PC134: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC136: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC137: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC138: Overwrote pending register: R14 in 'AssignReg'

      if (("\\mshta.exe").find)("\\python.exe", "\\python3.exe", "\\python", true) then
        break
      end
    end
  end
  do
    -- DECOMPILER ERROR at PC148: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC156: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC157: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC158: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC165: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC166: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC167: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC174: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC175: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC176: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC183: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC184: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC185: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC192: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC193: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC194: Overwrote pending register: R5 in 'AssignReg'

    do
      do
        if not l_0_5 and not l_0_5 and not l_0_5 and not l_0_5 and not l_0_5 then
          local l_0_12 = nil
        end
        -- DECOMPILER ERROR at PC203: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC204: Overwrote pending register: R5 in 'AssignReg'

        if not l_0_4 and not l_0_5 then
          return l_0_6
        end
        -- DECOMPILER ERROR at PC206: Overwrote pending register: R5 in 'AssignReg'

        l_0_6("CMDHSTR", "T1127.001", "SuspIlasmCompileScriptHost")
        -- DECOMPILER ERROR at PC211: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC212: Overwrote pending register: R5 in 'AssignReg'

        do return l_0_6 end
        -- WARNING: undefined locals caused missing assignments!
      end
    end
  end
end

