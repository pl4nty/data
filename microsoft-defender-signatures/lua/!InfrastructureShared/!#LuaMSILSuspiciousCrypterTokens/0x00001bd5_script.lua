-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaMSILSuspiciousCrypterTokens\0x00001bd5_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 >= 1048576 then
  return mp.CLEAN
end
local l_0_1 = (pe.get_netmetadata)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = {}
-- DECOMPILER ERROR at PC42: No list found for R8 , SetList fails

-- DECOMPILER ERROR at PC43: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC44: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC45: Overwrote pending register: R11 in 'AssignReg'

for l_0_12 = 1, 2, 3 do
  -- DECOMPILER ERROR at PC47: Overwrote pending register: R13 in 'AssignReg'

  local l_0_13 = 7
  -- DECOMPILER ERROR at PC48: Overwrote pending register: R14 in 'AssignReg'

  local l_0_14 = (9)[l_0_13]
  -- DECOMPILER ERROR at PC69: Overwrote pending register: R15 in 'AssignReg'

end
if (((l_0_13 == 1 and l_0_13 ~= 7) or l_0_13 == 9) and l_0_13 ~= 11) or l_0_13 == 33 then
  local l_0_15 = 300
  if l_0_4 <= 300 then
    local l_0_16 = false
    local l_0_17 = false
    if l_0_3 == 1 and (mp.get_mpattribute)("AGGR:IsDotNetAMSIScan") then
      local l_0_18 = l_0_1.strheap_RVA + (pe.metadata_decode)(1, 3) + 9
      local l_0_19 = (pe.mmap_string_rva)(l_0_18, 64)
      -- DECOMPILER ERROR at PC107: Overwrote pending register: R16 in 'AssignReg'

      if l_0_19 and #l_0_19 == 12 and (string.find)(l_0_19, 13) == 1 then
        (mp.set_mpattribute)("Lua:MSIL:PossiblyDynGenRuntimeClass.A")
      end
    end
    do
      ;
      (mp.set_mpattribute)("Lua:MSIL.AbnormalModuleCount")
      do
        if l_0_5 == 1 then
          local l_0_20 = (pe.metadata_decode)(536870913, 7)
          if l_0_20 and (string.format)("0x%08X", l_0_20) == "0x00000000" then
            (mp.set_mpattribute)("Lua:MSIL.PublicKeyNull")
          end
        end
        for l_0_24 = 1, l_0_15 do
          -- DECOMPILER ERROR at PC145: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC147: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC148: Overwrote pending register: R19 in 'AssignReg'

          local l_0_25 = l_0_1.strheap_RVA + ((18).metadata_decode)(22, 24)
          local l_0_26 = (pe.mmap_string_rva)(l_0_25, 64)
          -- DECOMPILER ERROR at PC162: Overwrote pending register: R20 in 'AssignReg'

          if l_0_26 and not l_0_16 then
            for l_0_30 = 1, #l_0_26, 25 do
              -- DECOMPILER ERROR at PC164: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC164: Overwrote pending register: R22 in 'AssignReg'

              -- DECOMPILER ERROR at PC165: Overwrote pending register: R24 in 'AssignReg'

              do
                do
                  local l_0_31 = (33)(36, 41)
                  if l_0_31 >= 126 or l_0_31 <= 32 then
                    break
                  end
                  -- DECOMPILER ERROR at PC173: LeaveBlock: unexpected jumping out DO_STMT

                end
              end
            end
          end
        end
        do
          do
            if (l_0_26 and #l_0_26 == 0 and l_0_16) or l_0_17 then
              (mp.set_mpattribute)("Lua:MSIL.AbnormalMethod.Name")
            end
            if l_0_2 < 100000 then
              (mp.set_mpattribute)("Lua:MSIL.MetadataSum:" .. tostring(l_0_2))
              ;
              (mp.set_mpattribute)("Lua:MSIL.TotalMethods:" .. tostring(l_0_4))
              ;
              (mp.set_mpattribute)("Lua:MSIL.TotalParams:" .. tostring(l_0_6))
              ;
              (mp.set_mpattribute)("Lua:MSIL.TotalMemberRefs:" .. tostring(l_0_7))
            end
            if l_0_2 == 158 and l_0_4 == 10 and l_0_6 == 5 and l_0_7 == 46 then
              (mp.set_mpattribute)("Lua:MSIL.SuspiciousCrypter.A")
            else
              if (l_0_4 == 625 or l_0_4 == 630) and l_0_6 == 135 and (l_0_7 == 288 or l_0_7 == 280) then
                (mp.set_mpattribute)("Lua:MSIL.SuspiciousCrypter.B")
              else
                if l_0_2 == 236 and l_0_4 == 22 and l_0_6 == 15 and l_0_7 == 51 then
                  (mp.set_mpattribute)("Lua:MSIL.SuspiciousCrypter.C")
                else
                  if l_0_2 == 263 and l_0_4 == 22 and l_0_6 == 8 and l_0_7 == 63 then
                    (mp.set_mpattribute)("Lua:MSIL.SuspiciousCrypter.D")
                  end
                end
              end
            end
            do return mp.CLEAN end
            -- WARNING: undefined locals caused missing assignments!
          end
        end
      end
    end
  end
end

