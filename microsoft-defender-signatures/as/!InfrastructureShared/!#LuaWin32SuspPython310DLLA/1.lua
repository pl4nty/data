-- Threat: !InfrastructureShared
-- Name: !#Lua:Win32/SuspPython310DLL.A
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

if mp.get_mpattribute("BM_UPX_PACKED") then
  return mp.CLEAN
end
if not mp.get_mpattribute("HSTR:Win32/Python310DLL") and not mp.get_mpattribute("Lua:FnameAttr!python310.dll") and not mp.get_mpattribute("Lua:CPythonModuleFileName.A") then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:Context/FileExportCountGTE!50") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 == nil or l_0_0 < 1030 or l_0_1 == nil then
  return mp.CLEAN
end
if mp.IsTrustedFile() then
  return mp.CLEAN
end
local l_0_2 = {
  ["1000-1300"] = {
    ExportApi = "Py_Main",
    CleanCodeInit = {
      [2213317461] = true,
      [1760330568] = true,
      [1222413132] = true,
      [1223459656] = true,
      [2202555200] = true,
      [3968026707] = true
    },
    ReadCodeSize = 288
  }
}
local l_0_3 = "Lua:Win32/SuspPython310DLL.A!"
local l_0_4 = 500
for l_0_5, l_0_6 in pairs(l_0_2) do
  local l_0_7, l_0_8 = l_0_5:match("^(%d+)%s*%-%s*(%d+)$")
  l_0_7 = l_0_7 and tonumber(l_0_7)
  l_0_8 = l_0_8 and tonumber(l_0_8)
  if l_0_0 >= l_0_8 and l_0_7 and l_0_8 and 0 < l_0_8 - l_0_7 then
    if l_0_4 < l_0_8 - l_0_7 then
      l_0_8 = l_0_7 + l_0_4
    end
    for l_0_9 = l_0_7, l_0_8 do
      local l_0_10 = pe.mmap_string_rva(l_0_1[l_0_9].namerva, 64)
      local l_0_11 = l_0_6.ExportApi
      if l_0_10 ~= nil and l_0_10 == l_0_11 then
        local l_0_12 = l_0_6.ReadCodeSize
        local l_0_13 = l_0_1[l_0_9].rva
        if l_0_12 ~= nil and l_0_13 ~= nil then
          local l_0_14 = pe.foffset_rva(l_0_13)
          local l_0_15 = l_0_6.CleanCodeInit
          if l_0_14 ~= nil and l_0_15 ~= nil then
            mp.readprotection(false)
            local l_0_16 = mp.readfile(l_0_14, l_0_12)
            if l_0_16 ~= nil then
              local l_0_17 = l_0_3 .. string.lower(l_0_11)
              local l_0_18 = mp.readu_u32(l_0_16, 1)
              if l_0_15[l_0_18] == nil then
                local l_0_19 = "Lua:Win32/SuspPythonApiCodeInit.A!" .. string.lower(l_0_11)
                mp.set_mpattribute(l_0_19)
                if string.find(l_0_16, "\204\204", 1, true) ~= nil and string.find(l_0_16, "\195", 1, true) ~= nil then
                  local l_0_20 = "Lua:Win32/CheckPythonApiCode.A!" .. string.lower(l_0_11)
                  mp.set_mpattribute(l_0_20)
                  return mp.CLEAN
                else
                  mp.set_mpattribute(l_0_17)
                  local l_0_21 = "Lua:Win32/SuspPythonApiCode.A!" .. string.lower(l_0_11)
                  mp.set_mpattribute(l_0_21)
                  return mp.INFECTED
                end
              end
              return mp.CLEAN
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
