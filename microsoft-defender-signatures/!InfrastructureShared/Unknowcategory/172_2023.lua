-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\172_2023.luac 

-- params : ...
-- function num : 0
local l_0_20, l_0_26, l_0_41, l_0_47, l_0_66, l_0_72, l_0_79, l_0_84, l_0_89, l_0_94 = nil, nil, nil, nil, nil
if (this_sigattrlog[1]).matched then
  local l_0_0, l_0_4, l_0_8, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16, l_0_22, l_0_29, l_0_31, l_0_33, l_0_35, l_0_37, l_0_43, l_0_50, l_0_53, l_0_56, l_0_59, l_0_62, l_0_68, l_0_75, l_0_80, l_0_85, l_0_90 = (string.lower)((this_sigattrlog[1]).utf8p1)
else
  do
    if (this_sigattrlog[2]).matched then
      local l_0_1, l_0_5, l_0_9, l_0_17, l_0_23, l_0_30, l_0_32, l_0_34, l_0_36, l_0_38, l_0_44, l_0_51, l_0_54, l_0_57, l_0_60, l_0_63, l_0_69, l_0_76, l_0_81, l_0_86, l_0_91 = , (string.lower)((this_sigattrlog[2]).utf8p1)
    else
      do
        if (this_sigattrlog[3]).matched then
          local l_0_2, l_0_6, l_0_10, l_0_18, l_0_24, l_0_39, l_0_45, l_0_52, l_0_55, l_0_58, l_0_61, l_0_64, l_0_70, l_0_77, l_0_82, l_0_87, l_0_92 = , (string.lower)((this_sigattrlog[3]).utf8p1)
        else
          do
            if (this_sigattrlog[4]).matched then
              local l_0_3 = nil
              l_0_3 = (string.gsub)((string.lower)((this_sigattrlog[4]).utf8p1), ".1.vb", ".0.vb")
            else
              do
                if (this_sigattrlog[5]).matched then
                  local l_0_7 = nil
                else
                  do
                    do
                      if (this_sigattrlog[6]).matched then
                        local l_0_11, l_0_19, l_0_25, l_0_40, l_0_46, l_0_65, l_0_71, l_0_78, l_0_83, l_0_88, l_0_93 = , (string.gsub)((string.lower)((this_sigattrlog[5]).utf8p1), ".1.cs", ".0.cs"), (string.lower)((this_sigattrlog[6]).utf8p1)
                        l_0_65 = string
                        l_0_65 = l_0_65.gsub
                        l_0_71 = l_0_40
                        l_0_78 = ".1.js"
                        l_0_83 = ".0.js"
                        l_0_65 = l_0_65(l_0_71, l_0_78, l_0_83)
                        l_0_25 = l_0_65
                      end
                      -- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC108: Confused about usage of register: R0 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC118: Confused about usage of register: R0 in 'UnsetPending'

                      do
                        if l_0_11 ~= nil and (sysio.IsFileExists)(l_0_11) and ((sysio.GetFileSize)(l_0_11) <= 8192 or not 8192) then
                          local l_0_28 = nil
                        end
                        -- DECOMPILER ERROR at PC130: Confused about usage of register: R1 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC134: Confused about usage of register: R1 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC140: Confused about usage of register: R1 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC150: Confused about usage of register: R1 in 'UnsetPending'

                        do
                          if l_0_19 ~= nil and (sysio.IsFileExists)(l_0_19) and ((sysio.GetFileSize)(l_0_19) <= 8192 or not 8192) then
                            local l_0_49 = nil
                            -- DECOMPILER ERROR at PC160: Overwrote pending register: R4 in 'AssignReg'

                          end
                          -- DECOMPILER ERROR at PC162: Confused about usage of register: R2 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC166: Confused about usage of register: R2 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC172: Confused about usage of register: R2 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC182: Confused about usage of register: R2 in 'UnsetPending'

                          do
                            if l_0_25 ~= nil and (sysio.IsFileExists)(l_0_25) and ((sysio.GetFileSize)(l_0_25) <= 12288 or not 12288) then
                              local l_0_74 = nil
                              -- DECOMPILER ERROR at PC192: Overwrote pending register: R4 in 'AssignReg'

                            end
                            -- DECOMPILER ERROR at PC204: Confused about usage of register: R4 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC210: Confused about usage of register: R4 in 'UnsetPending'

                            if (string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_11, 0, (sysio.GetFileSize)(l_0_11))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\") and (sysio.IsFileExists)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_11, 0, (sysio.GetFileSize)(l_0_11))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\")) then
                              local l_0_95 = nil
                              local l_0_96 = nil
                              -- DECOMPILER ERROR at PC225: Confused about usage of register: R4 in 'UnsetPending'

                              -- DECOMPILER ERROR at PC235: Confused about usage of register: R4 in 'UnsetPending'

                              if (string.find)("|.asp|aspx|ashx|asmx|", (string.sub)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_11, 0, (sysio.GetFileSize)(l_0_11))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\"), -4), 1, true) ~= nil and ((sysio.GetFileSize)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_11, 0, (sysio.GetFileSize)(l_0_11))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\")) <= 512 or not 512) then
                                local l_0_99 = nil
                                local l_0_100, l_0_101 = nil
                                if (MpCommon.StringRegExpSearch)("(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler)", tostring((sysio.ReadFile)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_11, 0, (sysio.GetFileSize)(l_0_11))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\"), 0, (sysio.GetFileSize)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_11, 0, (sysio.GetFileSize)(l_0_11))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\"))))) then
                                  return mp.CLEAN
                                end
                                local l_0_102 = nil
                                if (string.match)(l_0_101, "(.*\\)[^\\]+$") then
                                  (bm.add_related_string)("webshellpaths", (string.match)(l_0_101, "(.*\\)[^\\]+$"), bm.RelatedStringBMReport)
                                end
                                ;
                                (mp.ReportLowfi)(l_0_101, 3343198717)
                                ;
                                (bm.add_threat_file)(l_0_101)
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
end

