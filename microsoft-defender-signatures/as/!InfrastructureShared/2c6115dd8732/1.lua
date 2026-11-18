-- Threat: !InfrastructureShared
-- Name: 2c6115dd8732
-- Type: 21

if not mp.get_mpattribute("HSTR:SingleFileHostApp") then
  return mp.CLEAN
end

local function l_0_0(l_1_0)
  return tonumber(l_1_0:reverse():gsub(".", function(l_2_0)
    return string.format("%02x", string.byte(l_2_0))
  end), 16)
end

local function l_0_1(l_3_0)
  local l_3_1 = {}
  l_3_1.i = 1
  
  function l_3_1.ReadUInt32(l_4_0)
    local l_4_1 = mp.readu_u32(l_3_0, l_4_0.i)
    l_4_0.i = l_4_0.i + 4
    return l_4_1
  end
  
  function l_3_1.ReadUInt64(l_5_0)
    local l_5_1 = mp.readu_u64(l_3_0, l_5_0.i)
    l_5_0.i = l_5_0.i + 8
    return l_5_1
  end
  
  function l_3_1.ReadByte(l_6_0)
    l_6_0.i = l_6_0.i + 1
    return l_3_0:byte(l_6_0.i - 1)
  end
  
  function l_3_1.ReadString(l_7_0)
    local l_7_1 = l_3_0:byte(l_7_0.i)
    l_7_0.i = l_7_0.i + 1
    local l_7_2 = l_3_0:sub(l_7_0.i, l_7_0.i + l_7_1 - 1)
    l_7_0.i = l_7_0.i + l_7_1
    return l_7_2
  end
  
  return l_3_1
end

local function l_0_2(l_8_0)
  local l_8_1 = {
    Entries = {}
  }
  local l_8_2 = l_0_1(l_8_0)
  l_8_1.MajorVersion = l_8_2:ReadUInt32()
  l_8_1.MinorVersion = l_8_2:ReadUInt32()
  if l_8_1.MajorVersion < 1 or l_8_1.MajorVersion > 6 then
    return {}
  end
  l_8_1.FileCount = l_8_2:ReadUInt32()
  l_8_1.BundleID = l_8_2:ReadString()
  if l_8_1.MajorVersion >= 2 then
    l_8_1.DepsJsonOffset = l_8_2:ReadUInt64()
    l_8_1.DepsJsonSize = l_8_2:ReadUInt64()
    l_8_1.RuntimeConfigJsonOffset = l_8_2:ReadUInt64()
    l_8_1.RuntimeConfigJsonSize = l_8_2:ReadUInt64()
    l_8_1.Flags = l_8_2:ReadUInt64()
  end
  for l_8_3 = 1, l_8_1.FileCount do
    if 200 < l_8_3 then
      break
    end
    local l_8_4 = {}
    l_8_4.Offset = l_8_2:ReadUInt64()
    l_8_4.Size = l_8_2:ReadUInt64()
    if l_8_1.MajorVersion >= 6 then
      l_8_4.CompressedSize = l_8_2:ReadUInt64()
    else
      l_8_4.CompressedSize = 0
    end
    l_8_4.Type = l_8_2:ReadByte()
    l_8_4.RelativePath = l_8_2:ReadString()
    table.insert(l_8_1.Entries, l_8_4)
  end
  return l_8_1
end

local l_0_3 = hstrlog[1]
mp.readprotection(false)
local l_0_4 = l_0_0(mp.readfile(pe.foffset_va(l_0_3.VA) - 8, 8))
local l_0_5 = mp.readfile(l_0_4, mp.getfilesize() - l_0_4)
mp.readprotection(true)
local l_0_6, l_0_7 = pcall(l_0_2, l_0_5)
local l_0_8 = l_0_7.Entries
local l_0_9 = {
  "System%.",
  "Microsoft%.",
  "mscorlib%.dll",
  "SQLite",
  "WindowsBase%.dll",
  "netstandard%.dll",
  "HtmlAgilityPack%.dll",
  "Newtonsoft%.Json%.dll",
  "NgrokSharp%.dll",
  "BouncyCastle%.Crypto%.dll",
  "ScaleHQ%.DotScreen%.dll",
  "Telegram%.Bot%.dll",
  "e_sqlite3%.dll"
}
mp.readprotection(false)
for l_0_10, l_0_11 in pairs(l_0_8) do
  local l_0_12 = false
  for l_0_13, l_0_14 in pairs(l_0_9) do
    if string.find(l_0_11.RelativePath, "^" .. l_0_14) ~= nil then
      l_0_12 = true
      break
    end
  end
  if not l_0_12 then
    if l_0_11.CompressedSize > 0 then
      local l_0_15 = "CWSHACK\000x\156"
      local l_0_16 = mp.readfile(l_0_11.Offset, l_0_11.Size)
      mp.vfo_add_buffer(l_0_15 .. l_0_16, l_0_11.RelativePath .. "-[DotNetCompressed]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    else
      mp.vfo_add_filechunk(l_0_11.Offset, l_0_11.Size, l_0_11.RelativePath, mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    end
    mp.UfsSetMetadataBool("DotNetCoreBundleExtracts", true, true)
  end
end
mp.readprotection(true)
return mp.INFECTED
