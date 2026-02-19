-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaWin32SuspPython310DLLA\1.luac 

-- params : ...
-- function num : 0
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
l_0_3.CleanCodeInit = l_0_4
l_0_3.CleanCodeSize = 42
l_0_3.CleanCodeCrc32 = 2027010068
l_0_2["1000-1300"] = l_0_3
l_0_3 = false
l_0_4 = "Lua:Win32/SuspPython310DLL.A!"
local l_0_5 = 500
for l_0_9,l_0_10 in pairs(l_0_2) do
  local l_0_11, l_0_12 = l_0_9:match("^(%d+)%s*%-%s*(%d+)$")
  if l_0_11 then
    l_0_11 = tonumber(l_0_11)
  end
  if l_0_12 then
    l_0_12 = tonumber(l_0_12)
  end
  if l_0_12 <= l_0_0 and l_0_11 and l_0_12 and l_0_12 - l_0_11 > 0 then
    if l_0_5 < l_0_12 - l_0_11 then
      l_0_12 = l_0_11 + l_0_5
    end
    for l_0_16 = l_0_11, l_0_12 do
      local l_0_17 = (pe.mmap_string_rva)((l_0_1[l_0_16]).namerva, 64)
      local l_0_18 = l_0_10.ExportApi
      if l_0_17 ~= nil and l_0_17 == l_0_18 then
        local l_0_19 = l_0_10.CleanCodeSize
        local l_0_20 = (l_0_1[l_0_16]).rva
        if l_0_19 ~= nil and l_0_20 ~= nil then
          local l_0_21 = (pe.foffset_rva)(l_0_20)
          local l_0_22 = l_0_10.CleanCodeInit
          if l_0_21 ~= nil and l_0_22 ~= nil then
            (mp.readprotection)(false)
            local l_0_23 = (mp.readfile)(l_0_21, l_0_19)
            if l_0_23 ~= nil then
              local l_0_24 = l_0_4 .. (string.lower)(l_0_18)
              local l_0_25 = (mp.readu_u32)(l_0_23, 1)
              if l_0_22[l_0_25] == true then
                local l_0_26 = (mp.crc32)(-1, l_0_23, 1, l_0_19)
                local l_0_27 = l_0_10.CleanCodeCrc32
                if l_0_26 ~= nil and l_0_27 ~= nil and l_0_26 ~= l_0_27 then
                  l_0_3 = true
                  ;
                  (mp.set_mpattribute)(l_0_24)
                  local l_0_28 = "Lua:Win32/SuspPythonApiCodeCrc32.A!" .. (string.lower)(l_0_18)
                  ;
                  (mp.set_mpattribute)(l_0_28)
                end
              else
                do
                  l_0_3 = true
                  ;
                  (mp.set_mpattribute)(l_0_24)
                  do
                    local l_0_29 = "Lua:Win32/SuspPythonApiCodeInit.A!" .. (string.lower)(l_0_18)
                    ;
                    (mp.set_mpattribute)(l_0_29)
                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC199: LeaveBlock: unexpected jumping out IF_STMT

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
if l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN

