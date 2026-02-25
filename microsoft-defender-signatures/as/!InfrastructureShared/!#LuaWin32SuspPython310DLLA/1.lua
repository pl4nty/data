-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaWin32SuspPython310DLLA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("BM_UPX_PACKED") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("HSTR:Win32/Python310DLL") and not (mp.get_mpattribute)("Lua:FnameAttr!python310.dll") and not (mp.get_mpattribute)("Lua:CPythonModuleFileName.A") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:Context/FileExportCountGTE!50") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (pe.get_exports)()
if l_0_0 == nil or l_0_0 < 1030 or l_0_1 == nil then
  return mp.CLEAN
end
if (mp.IsTrustedFile)() then
  return mp.CLEAN
end
local l_0_2 = {}
local l_0_3 = {}
l_0_3.ExportApi = "Py_Main"
local l_0_4 = {}
l_0_4[2213317461] = true
l_0_4[1760330568] = true
l_0_4[1222413132] = true
l_0_4[1223459656] = true
l_0_4[2202555200] = true
l_0_4[3968026707] = true
l_0_3.CleanCodeInit = l_0_4
l_0_3.ReadCodeSize = 288
l_0_2["1000-1300"] = l_0_3
l_0_3 = "Lua:Win32/SuspPython310DLL.A!"
l_0_4 = 500
for l_0_8,l_0_9 in pairs(l_0_2) do
  local l_0_10, l_0_11 = l_0_8:match("^(%d+)%s*%-%s*(%d+)$")
  if l_0_10 then
    l_0_10 = tonumber(l_0_10)
  end
  if l_0_11 then
    l_0_11 = tonumber(l_0_11)
  end
  if l_0_11 <= l_0_0 and l_0_10 and l_0_11 and l_0_11 - l_0_10 > 0 then
    if l_0_4 < l_0_11 - l_0_10 then
      l_0_11 = l_0_10 + l_0_4
    end
    for l_0_15 = l_0_10, l_0_11 do
      local l_0_16 = (pe.mmap_string_rva)((l_0_1[l_0_15]).namerva, 64)
      local l_0_17 = l_0_9.ExportApi
      if l_0_16 ~= nil and l_0_16 == l_0_17 then
        local l_0_18 = l_0_9.ReadCodeSize
        local l_0_19 = (l_0_1[l_0_15]).rva
        if l_0_18 ~= nil and l_0_19 ~= nil then
          local l_0_20 = (pe.foffset_rva)(l_0_19)
          local l_0_21 = l_0_9.CleanCodeInit
          if l_0_20 ~= nil and l_0_21 ~= nil then
            (mp.readprotection)(false)
            local l_0_22 = (mp.readfile)(l_0_20, l_0_18)
            if l_0_22 ~= nil then
              local l_0_23 = l_0_3 .. (string.lower)(l_0_17)
              local l_0_24 = (mp.readu_u32)(l_0_22, 1)
              if l_0_21[l_0_24] == nil then
                local l_0_25 = "Lua:Win32/SuspPythonApiCodeInit.A!" .. (string.lower)(l_0_17)
                ;
                (mp.set_mpattribute)(l_0_25)
                if (string.find)(l_0_22, "лл", 1, true) ~= nil and (string.find)(l_0_22, "\195", 1, true) ~= nil then
                  local l_0_26 = "Lua:Win32/CheckPythonApiCode.A!" .. (string.lower)(l_0_17)
                  ;
                  (mp.set_mpattribute)(l_0_26)
                  return mp.CLEAN
                else
                  do
                    ;
                    (mp.set_mpattribute)(l_0_23)
                    do
                      do
                        local l_0_27 = "Lua:Win32/SuspPythonApiCode.A!" .. (string.lower)(l_0_17)
                        ;
                        (mp.set_mpattribute)(l_0_27)
                        do return mp.INFECTED end
                        do return mp.CLEAN end
                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

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
return mp.CLEAN

