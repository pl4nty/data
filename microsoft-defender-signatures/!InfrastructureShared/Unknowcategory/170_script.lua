-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\170_luac 

-- params : ...
-- function num : 0
local l_0_3, l_0_8, l_0_26, l_0_32, l_0_47, l_0_53, l_0_60, l_0_64, l_0_68, l_0_72 = nil, nil, nil, nil, nil
if (this_sigattrlog[1]).matched then
  local l_0_0, l_0_5, l_0_10, l_0_13 = (string.lower)((this_sigattrlog[1]).utf8p1)
else
  do
    if (this_sigattrlog[2]).matched then
      local l_0_2, l_0_7, l_0_12, l_0_15, l_0_18, l_0_25, l_0_31, l_0_46, l_0_52, l_0_59, l_0_63, l_0_67, l_0_71 = , (string.lower)((this_sigattrlog[2]).utf8p1)
    else
      do
        if (this_sigattrlog[3]).matched then
          local l_0_1, l_0_6, l_0_11, l_0_14, l_0_17 = , (string.lower)((this_sigattrlog[3]).utf8p1)
        else
          do
            if (this_sigattrlog[4]).matched then
              local l_0_4 = nil
              l_0_4 = (string.gsub)((string.lower)((this_sigattrlog[4]).utf8p1), ".1.cs", ".0.cs")
            else
              do
                do
                  if (this_sigattrlog[5]).matched then
                    local l_0_9, l_0_27, l_0_33, l_0_48, l_0_54, l_0_73 = , (string.lower)((this_sigattrlog[5]).utf8p1)
                    l_0_73 = string
                    l_0_73 = l_0_73.gsub
                    l_0_73 = l_0_73(l_0_54, ".1.js", ".0.js")
                    l_0_27 = l_0_73
                  end
                  -- DECOMPILER ERROR at PC78: Confused about usage of register: R2 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC82: Confused about usage of register: R2 in 'UnsetPending'

                  if l_0_33 ~= nil then
                    local l_0_16, l_0_19, l_0_20, l_0_21, l_0_22, l_0_23, l_0_29, l_0_36, l_0_38, l_0_40, l_0_42, l_0_44, l_0_50, l_0_57, l_0_61, l_0_65, l_0_69 = (string.gsub)(l_0_33, ".dll", ".0.cs")
                    l_0_23 = string
                    l_0_23 = l_0_23.gsub
                    l_0_29 = l_0_20
                    l_0_36 = ".dll"
                    l_0_38 = ".0.js"
                    l_0_23 = l_0_23(l_0_29, l_0_36, l_0_38)
                    l_0_19 = l_0_23
                    local l_0_24, l_0_30, l_0_37, l_0_39, l_0_41, l_0_43, l_0_45, l_0_51, l_0_58, l_0_62, l_0_66, l_0_70 = nil
                  end
                  do
                    -- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC114: Confused about usage of register: R0 in 'UnsetPending'

                    if l_0_16 ~= nil and (sysio.IsFileExists)(l_0_16) and ((sysio.GetFileSize)(l_0_16) <= 8192 or not 8192) then
                      local l_0_35 = nil
                    else
                      do
                        -- DECOMPILER ERROR at PC126: Confused about usage of register: R1 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC130: Confused about usage of register: R1 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC136: Confused about usage of register: R1 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC146: Confused about usage of register: R1 in 'UnsetPending'

                        do
                          if l_0_19 ~= nil and (sysio.IsFileExists)(l_0_19) and ((sysio.GetFileSize)(l_0_19) <= 12288 or not 12288) then
                            local l_0_56 = nil
                            -- DECOMPILER ERROR at PC156: Overwrote pending register: R3 in 'AssignReg'

                          end
                          -- DECOMPILER ERROR at PC168: Confused about usage of register: R3 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC174: Confused about usage of register: R3 in 'UnsetPending'

                          if (string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_16, 0, (sysio.GetFileSize)(l_0_16))), "#pragma checksum \"([^\"]+)"), "\\\\", "\\") and (sysio.IsFileExists)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_16, 0, (sysio.GetFileSize)(l_0_16))), "#pragma checksum \"([^\"]+)"), "\\\\", "\\")) then
                            local l_0_74 = nil
                            local l_0_75 = nil
                            -- DECOMPILER ERROR at PC189: Confused about usage of register: R3 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC199: Confused about usage of register: R3 in 'UnsetPending'

                            if (string.find)("|.asp|aspx|ashx|asmx|", (string.sub)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_16, 0, (sysio.GetFileSize)(l_0_16))), "#pragma checksum \"([^\"]+)"), "\\\\", "\\"), -4), 1, true) ~= nil and ((sysio.GetFileSize)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_16, 0, (sysio.GetFileSize)(l_0_16))), "#pragma checksum \"([^\"]+)"), "\\\\", "\\")) <= 512 or not 512) then
                              local l_0_78 = nil
                              local l_0_79, l_0_80 = nil
                              if (MpCommon.StringRegExpSearch)("(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler|CKEditor)", tostring((sysio.ReadFile)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_16, 0, (sysio.GetFileSize)(l_0_16))), "#pragma checksum \"([^\"]+)"), "\\\\", "\\"), 0, (sysio.GetFileSize)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_16, 0, (sysio.GetFileSize)(l_0_16))), "#pragma checksum \"([^\"]+)"), "\\\\", "\\"))))) then
                                return mp.CLEAN
                              end
                              local l_0_81 = nil
                              if (string.match)(l_0_79, "(.*\\)[^\\]+$") then
                                (bm.add_related_string)("webshellpaths", (string.match)(l_0_79, "(.*\\)[^\\]+$"), bm.RelatedStringBMReport)
                              end
                              ;
                              (mp.ReportLowfi)(l_0_79, 2206080980)
                              return mp.INFECTED
                            end
                          end
                          do
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

