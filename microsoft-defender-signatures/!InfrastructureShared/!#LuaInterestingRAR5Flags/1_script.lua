-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaInterestingRAR5Flags\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = 0
  local l_1_2 = (l_1_0.val)[1]
  while l_1_2 > 127 do
    l_1_1 = l_1_1 + (mp.shl32)((mp.bitand)(l_1_2, 127), 0 * 7)
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R3 in 'UnsetPending'

    local l_1_3, l_1_4 = 0 + 1
    l_1_4 = l_1_0.val
    l_1_2 = l_1_4[l_1_3 + 1]
  end
  do
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R3 in 'UnsetPending'

    l_1_1 = l_1_1 + (mp.shl32)((mp.bitand)(l_1_2, 127), l_1_3 * 7)
    return l_1_1
  end
end

if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
if (mp.readu_u32)(headerpage, 1) ~= 561144146 then
  return mp.CLEAN
end
if (mp.readu_u16)(headerpage, 5) ~= 1818 then
  return mp.CLEAN
end
if headerpage[7] == 1 then
  local l_0_2 = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_0
  local l_2_1 = headerpage[l_2_0 + 4]
  local l_2_2 = headerpage[l_2_0 + 5]
  local l_2_3 = headerpage[l_2_0 + 6]
  local l_2_4 = 0
  local l_2_5 = 0
  local l_2_6 = 0
  local l_2_7 = 0
  local l_2_8 = 0
  local l_2_9 = 0
  if l_2_2 == 3 and l_2_3 == 2 then
    (mp.set_mpattribute)("Lua:Rar5HasCommentBlock")
    l_2_4 = 7
    local l_2_10 = headerpage[l_2_0 + l_2_4]
    local l_2_11 = headerpage[l_2_0 + l_2_4 + 1]
    local l_2_12 = headerpage[l_2_0 + l_2_4 + 2]
    local l_2_13 = headerpage[l_2_0 + l_2_4 + 3]
    local l_2_14 = 0
    if l_2_12 == 4 and l_2_13 ~= 4 then
      l_2_14 = 2
      local l_2_15 = {}
      local l_2_16 = {}
      -- DECOMPILER ERROR at PC49: No list found for R16 , SetList fails

      -- DECOMPILER ERROR at PC52: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC55: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC56: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC59: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC60: Overwrote pending register: R16 in 'AssignReg'

      if l_2_16 < l_2_9 then
        l_2_16("Lua:Rar5HasCommentBlockTooBig")
        -- DECOMPILER ERROR at PC63: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC64: Overwrote pending register: R16 in 'AssignReg'

        return l_2_16
      end
    else
      do
        do
          -- DECOMPILER ERROR at PC69: Overwrote pending register: R16 in 'AssignReg'

          ;
          (mp.set_mpattribute)(l_2_16)
          do return mp.CLEAN end
          if headerpage[l_2_0 + (l_2_4)] ~= 0 then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC89: Overwrote pending register: R4 in 'AssignReg'

          if headerpage[l_2_0 + (l_2_4)] ~= 67 then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC99: Overwrote pending register: R4 in 'AssignReg'

          -- DECOMPILER ERROR at PC101: Overwrote pending register: R18 in 'AssignReg'

          l_2_6 = headerpage[l_2_11 + 4]
          l_2_1 = l_2_6
          l_2_7 = headerpage[l_2_0 + (l_2_4) + 4 + 1]
          l_2_8 = headerpage[l_2_0 + (l_2_4) + 4 + 1 + 1]
          if (l_2_2 == 1 and l_2_3 == 2) or l_2_7 == 1 and l_2_8 == 2 then
            l_2_5 = 2
            -- DECOMPILER ERROR at PC129: Overwrote pending register: R4 in 'AssignReg'

          else
            if l_2_2 == 2 or l_2_7 == 2 then
              l_2_5 = 1
              -- DECOMPILER ERROR at PC140: Overwrote pending register: R4 in 'AssignReg'

            else
              if l_2_2 == 5 and l_2_3 == 4 then
                (mp.set_mpattribute)("Lua:Rar5HasNoFileInside")
                return mp.CLEAN
              end
            end
          end
          if (l_2_3 == 2 or l_2_8 == 2 or l_2_2 == 2 or l_2_7 == 2) and l_2_0 + l_2_1 < mp.HEADERPAGE_SZ then
            local l_2_17 = headerpage[l_2_0 + (l_2_4) + 1]
            local l_2_18 = 0
            local l_2_19 = 0
            local l_2_20 = 0
            local l_2_21 = 0
            local l_2_22 = 0
            local l_2_23 = 1
            local l_2_24 = 1
            if l_2_17 == 0 then
              l_2_23 = 2
              l_2_24 = l_2_23
            else
              if l_2_17 > 0 and l_2_17 < 256 then
                l_2_18 = headerpage[l_2_0 + (l_2_4) + 2]
                if l_2_18 == 4 then
                  l_2_22 = headerpage[l_2_0 + (l_2_4) + 3]
                  if l_2_22 == 4 then
                    l_2_23 = 3
                  else
                    l_2_23 = 2
                  end
                else
                  if l_2_18 == 0 then
                    l_2_23 = 3
                  else
                    if l_2_18 > 0 and l_2_18 < 256 then
                      l_2_19 = headerpage[l_2_0 + (l_2_4) + 3]
                      if l_2_19 == 4 then
                        l_2_22 = headerpage[l_2_0 + (l_2_4) + 4]
                        if l_2_22 == 4 then
                          l_2_23 = 4
                        else
                          l_2_23 = 3
                        end
                      else
                        if l_2_19 == 0 then
                          l_2_23 = 4
                        else
                          if l_2_19 > 0 and l_2_19 < 256 then
                            l_2_20 = headerpage[l_2_0 + (l_2_4) + 4]
                            if l_2_20 == 4 then
                              l_2_22 = headerpage[l_2_0 + (l_2_4) + 5]
                              if l_2_22 == 4 then
                                l_2_23 = 5
                              else
                                l_2_23 = 4
                              end
                            else
                              if l_2_20 == 0 then
                                l_2_23 = 5
                              else
                                if l_2_20 > 0 and l_2_20 < 256 then
                                  l_2_21 = headerpage[l_2_0 + (l_2_4) + 5]
                                  if l_2_21 == 4 then
                                    l_2_22 = headerpage[l_2_0 + (l_2_4) + 6]
                                    if l_2_22 == 4 then
                                      l_2_23 = 6
                                    else
                                      l_2_23 = 5
                                    end
                                  else
                                    if l_2_21 == 0 then
                                      l_2_23 = 6
                                    else
                                      if l_2_21 > 0 and l_2_21 < 256 then
                                        return mp.CLEAN
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            l_2_24 = l_2_23
            local l_2_25 = l_2_4 + l_2_23 + 1 + l_2_24
            local l_2_26 = headerpage[l_2_0 + l_2_25]
            if l_2_26 ~= 32 then
              return mp.CLEAN
            end
            local l_2_27 = l_2_4 + l_2_23 + 1 + l_2_24 + 1 + 4
            local l_2_28 = headerpage[l_2_0 + l_2_27 + 1]
            -- DECOMPILER ERROR at PC307: Overwrote pending register: R4 in 'AssignReg'

            local l_2_29 = headerpage[l_2_0 + (l_2_4)]
            if l_2_29 == 0 then
              return mp.CLEAN
            end
            local l_2_30 = l_2_4 + 1
            local l_2_31 = 0
            local l_2_32 = ""
            local l_2_33 = ""
            local l_2_34 = "%."
            for l_2_38 = 0, l_2_29 - 1 do
              l_2_31 = headerpage[l_2_0 + l_2_30 + l_2_38]
              l_2_32 = (string.char)(l_2_31)
              l_2_33 = l_2_33 .. l_2_32
            end
            if l_2_33:match("password") then
              (mp.set_mpattribute)("Lua:Rar5HasFileNameWithKeyWord")
            end
            if l_2_33:match("/") then
              (mp.set_mpattribute)("Lua:Rar5HasFolder")
            end
            if not l_2_33:find(l_2_34) then
              (mp.set_mpattribute)("Lua:Rar5FirstFileHasNoExtension")
            end
            if l_2_29 > 4 then
              local l_2_39 = {}
              l_2_39[".bat"] = ""
              l_2_39[".cmd"] = ""
              l_2_39[".com"] = ""
              l_2_39[".cpl"] = ""
              l_2_39[".exe"] = ""
              l_2_39[".pif"] = ""
              l_2_39[".scr"] = ""
              l_2_39[".vbs"] = ""
              l_2_39[".lnk"] = ""
              l_2_39[".wsf"] = ""
              l_2_39[".vbe"] = ""
              l_2_39[".jse"] = ""
              l_2_39[".hta"] = ""
              l_2_39[".js"] = ""
              l_2_39[".dll"] = ""
              l_2_39[".ocx"] = ""
              l_2_39[".ps1"] = ""
              l_2_39[".jar"] = ""
              l_2_39[".wsc"] = ""
              l_2_39[".wsh"] = ""
              l_2_39[".msi"] = ""
              l_2_39[".url"] = ""
              local l_2_40 = {}
              l_2_40[".html"] = ""
              local l_2_41 = {}
              l_2_41[".zip"] = ""
              l_2_41[".tar"] = ""
              l_2_41[".gz"] = ""
              l_2_41[".tgz"] = ""
              l_2_41[".7z"] = ""
              l_2_41[".iso"] = ""
              l_2_41[".vhd"] = ""
              l_2_41[".img"] = ""
              l_2_41[".dmg"] = ""
              local l_2_42 = {}
              l_2_42[".txt"] = ""
              l_2_42[".pdf"] = ""
              l_2_42[".xls"] = ""
              l_2_42[".xlsx"] = ""
              l_2_42[".xlsm"] = ""
              l_2_42[".xlsb"] = ""
              l_2_42[".xla"] = ""
              l_2_42[".xltm"] = ""
              l_2_42[".xlam"] = ""
              l_2_42[".csv"] = ""
              l_2_42[".xml"] = ""
              l_2_42[".jpg"] = ""
              l_2_42[".gif"] = ""
              l_2_42[".png"] = ""
              l_2_42[".jpeg"] = ""
              l_2_42[".pic"] = ""
              l_2_42[".mp3"] = ""
              l_2_42[".doc"] = ""
              l_2_42[".docx"] = ""
              l_2_42[".mkv"] = ""
              local l_2_43 = (string.sub)(l_2_33, -4)
              local l_2_44 = (string.sub)(l_2_33, -5)
              local l_2_45 = (string.sub)(l_2_33, -3)
              if l_2_39[l_2_43] or l_2_42[l_2_43] then
                l_2_43 = (string.sub)(l_2_43, 2)
                if l_2_28 ~= 0 then
                  (mp.set_mpattribute)("Lua:Rar5HasFileWith!" .. l_2_43)
                else
                  ;
                  (mp.set_mpattribute)("Lua:Rar5HasStoredFileWith!" .. l_2_43)
                end
              end
              if l_2_39[l_2_45] then
                l_2_45 = (string.sub)(l_2_45, 2)
                if l_2_28 ~= 0 then
                  (mp.set_mpattribute)("Lua:Rar5HasFileWith!" .. l_2_45)
                else
                  ;
                  (mp.set_mpattribute)("Lua:Rar5HasStoredFileWith!" .. l_2_45)
                end
              end
              if l_2_41[l_2_43] then
                l_2_43 = (string.sub)(l_2_43, 2)
                if l_2_28 ~= 0 then
                  (mp.set_mpattribute)("Lua:Rar5HasArchiveWith!" .. l_2_43)
                else
                  ;
                  (mp.set_mpattribute)("Lua:Rar5HasStoredArchiveWith!" .. l_2_43)
                end
              end
              if l_2_41[l_2_45] then
                l_2_45 = (string.sub)(l_2_45, 2)
                if l_2_28 ~= 0 then
                  (mp.set_mpattribute)("Lua:Rar5HasArchiveWith!" .. l_2_45)
                else
                  ;
                  (mp.set_mpattribute)("Lua:Rar5HasStoredArchiveWith!" .. l_2_45)
                end
              end
              if l_2_44 ~= nil and (l_2_40[l_2_44] or l_2_42[l_2_44]) then
                l_2_44 = (string.sub)(l_2_44, 2)
                if l_2_28 ~= 0 then
                  (mp.set_mpattribute)("Lua:Rar5HasFileWith!" .. l_2_44)
                else
                  ;
                  (mp.set_mpattribute)("Lua:Rar5HasStoredFileWith!" .. l_2_44)
                end
              end
            end
          else
            do
              ;
              (mp.set_mpattribute)("Lua:Rar5HasNoFileOrCommentBlock")
              do return mp.CLEAN end
              return mp.CLEAN
            end
          end
        end
      end
    end
  end
end

  local l_0_3 = nil
  while 1 do
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC57: Confused about usage of register: R4 in 'UnsetPending'

  end
end
do
  if 1 < 2 and (mp.bitand)((mp.readu_u16)(headerpage, 13), 255) + 13 + 1 + 4 < mp.HEADERPAGE_SZ then
    do
      do return mp.CLEAN end
      -- DECOMPILER ERROR at PC62: freeLocal<0 in 'ReleaseLocals'

      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

