-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLUASuspiciousImportSequence\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (pe.get_imports)()
if l_0_1 == nil or l_0_0 < 8 then
  return mp.CLEAN
end
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = {}
do
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC18: No list found for R7 , SetList fails

  for l_0_6 = l_0_3, l_0_4, l_0_5 do
    -- DECOMPILER ERROR at PC29: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC30: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC33: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC34: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC35: Overwrote pending register: R9 in 'AssignReg'

    if l_0_7 ~= nil then
      for l_0_11 = true, "Rhysida" do
        -- DECOMPILER ERROR at PC41: Overwrote pending register: R7 in 'AssignReg'

        if l_0_7 == nil then
          break
        else
          if l_0_7[1] == true then
            if l_0_7[2] ~= nil then
              (mp.set_mpattribute)("ImportSequenceSignature_" .. l_0_7[2])
            end
            return mp.INFECTED
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC63: Overwrote pending register: R3 in 'AssignReg'

  do return l_0_3.CLEAN end
  -- DECOMPILER ERROR at PC66: Confused about usage of register R6 for local variables in 'ReleaseLocals'

end

