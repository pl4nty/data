-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32GodLoaderBS\1.luac 

-- params : ...
-- function num : 0
(mp.readprotection)(false)
local l_0_0, l_0_1 = pcall(mp.getfilesize)
if not l_0_0 or isnull(l_0_1) then
  return mp.CLEAN
end
if l_0_1 <= 65536 or not 65536 then
  local l_0_2 = (mp.readfile)(0, l_0_1)
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  l_0_2 = tostring(l_0_2)
  l_0_2 = (string.lower)(l_0_2)
  ;
  (mp.readprotection)(true)
  if l_0_2:find("GDPC", 1, true) ~= 1 then
    local l_0_3 = l_0_2:find("GDPC", 5, true)
    l_0_3 = l_0_3
    do
      local l_0_4 = nil
      if not l_0_3 then
        return mp.CLEAN
      end
      local l_0_5 = {}
      -- DECOMPILER ERROR at PC75: No list found for R4 , SetList fails

      -- DECOMPILER ERROR at PC76: Overwrote pending register: R5 in 'AssignReg'

      do
        local l_0_6 = "os.execute("
        -- DECOMPILER ERROR at PC77: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC78: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC79: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC86: Overwrote pending register: R9 in 'AssignReg'

        if ("add%-mppreference")("runas", "bitbucket%.org") then
          set_research_data("[=>] GODOT_PCK_HEADER: ", tostring("github%.com"), false)
          return mp.INFECTED
        end
        do return mp.CLEAN end
        -- DECOMPILER ERROR: 4 unprocessed JMP targets
      end
    end
  end
end

