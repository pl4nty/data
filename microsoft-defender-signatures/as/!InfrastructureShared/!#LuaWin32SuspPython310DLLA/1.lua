-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaWin32SuspPython310DLLA\1.luac 

-- params : ...
-- function num : 0
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
l_0_3.CleanCodeInit = 2213317461
l_0_3.CleanCodeSize = 42
l_0_3.CleanCodeCrc32 = 2027010068
l_0_2[1030] = l_0_3
l_0_3 = false
local l_0_4 = "Lua:Win32/SuspPython310DLL.A!"
for l_0_8,l_0_9 in pairs(l_0_2) do
  local l_0_10 = (pe.mmap_string_rva)((l_0_1[l_0_8]).namerva, 64)
  local l_0_11 = l_0_9.ExportApi
  if l_0_10 ~= nil and l_0_10 == l_0_11 then
    local l_0_12 = l_0_9.CleanCodeSize
    local l_0_13 = (l_0_1[l_0_8]).rva
    if l_0_12 ~= nil and l_0_13 ~= nil then
      local l_0_14 = (pe.foffset_rva)(l_0_13)
      local l_0_15 = l_0_9.CleanCodeInit
      if l_0_14 ~= nil and l_0_15 ~= nil then
        (mp.readprotection)(false)
        local l_0_16 = (mp.readfile)(l_0_14, l_0_12)
        if l_0_16 ~= nil then
          local l_0_17 = l_0_4 .. (string.lower)(l_0_11)
          if (mp.readu_u32)(l_0_16, 1) == l_0_15 then
            local l_0_18 = (mp.crc32)(-1, l_0_16, 1, l_0_12)
            local l_0_19 = l_0_9.CleanCodeCrc32
            if l_0_18 ~= nil and l_0_19 ~= nil and l_0_18 ~= l_0_19 then
              l_0_3 = true
              ;
              (mp.set_mpattribute)(l_0_17)
            end
          else
            do
              do
                l_0_3 = true
                ;
                (mp.set_mpattribute)(l_0_17)
                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_STMT

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

