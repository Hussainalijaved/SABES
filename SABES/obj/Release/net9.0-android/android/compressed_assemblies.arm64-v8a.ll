; ModuleID = 'compressed_assemblies.arm64-v8a.ll'
source_filename = "compressed_assemblies.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.CompressedAssemblies = type {
	i32, ; uint32_t count
	ptr ; CompressedAssemblyDescriptor descriptors
}

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i1, ; bool loaded
	ptr ; uint8_t data
}

@compressed_assemblies = dso_local local_unnamed_addr global %struct.CompressedAssemblies {
	i32 263, ; uint32_t count
	ptr @compressed_assembly_descriptors; CompressedAssemblyDescriptor* descriptors
}, align 8

@compressed_assembly_descriptors = internal dso_local global [263 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 46752, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_0; uint8_t* data
	}, ; 0: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 48304, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_1; uint8_t* data
	}, ; 1: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 48304, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_2; uint8_t* data
	}, ; 2: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 48800, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_3; uint8_t* data
	}, ; 3: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 48800, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_4; uint8_t* data
	}, ; 4: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 51872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_5; uint8_t* data
	}, ; 5: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 48800, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_6; uint8_t* data
	}, ; 6: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 48816, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_7; uint8_t* data
	}, ; 7: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 47264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_8; uint8_t* data
	}, ; 8: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 58528, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_9; uint8_t* data
	}, ; 9: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 46752, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_10; uint8_t* data
	}, ; 10: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 43680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_11; uint8_t* data
	}, ; 11: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 44192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_12; uint8_t* data
	}, ; 12: Microsoft.CodeAnalysis.resources
	%struct.CompressedAssemblyDescriptor {
		i32 421552, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_13; uint8_t* data
	}, ; 13: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 450208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_14; uint8_t* data
	}, ; 14: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 440480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_15; uint8_t* data
	}, ; 15: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 451232, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_16; uint8_t* data
	}, ; 16: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 447240, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_17; uint8_t* data
	}, ; 17: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 492704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_18; uint8_t* data
	}, ; 18: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 452272, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_19; uint8_t* data
	}, ; 19: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 453280, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_20; uint8_t* data
	}, ; 20: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 432800, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_21; uint8_t* data
	}, ; 21: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 595104, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_22; uint8_t* data
	}, ; 22: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 429216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_23; uint8_t* data
	}, ; 23: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 382128, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_24; uint8_t* data
	}, ; 24: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 381600, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_25; uint8_t* data
	}, ; 25: Microsoft.CodeAnalysis.CSharp.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_26; uint8_t* data
	}, ; 26: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_27; uint8_t* data
	}, ; 27: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_28; uint8_t* data
	}, ; 28: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_29; uint8_t* data
	}, ; 29: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18096, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_30; uint8_t* data
	}, ; 30: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18096, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_31; uint8_t* data
	}, ; 31: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_32; uint8_t* data
	}, ; 32: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_33; uint8_t* data
	}, ; 33: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18096, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_34; uint8_t* data
	}, ; 34: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_35; uint8_t* data
	}, ; 35: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_36; uint8_t* data
	}, ; 36: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_37; uint8_t* data
	}, ; 37: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 18192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_38; uint8_t* data
	}, ; 38: Microsoft.CodeAnalysis.CSharp.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 48304, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_39; uint8_t* data
	}, ; 39: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 49824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_40; uint8_t* data
	}, ; 40: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 49824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_41; uint8_t* data
	}, ; 41: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 50848, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_42; uint8_t* data
	}, ; 42: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 50336, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_43; uint8_t* data
	}, ; 43: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 53408, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_44; uint8_t* data
	}, ; 44: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 50336, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_45; uint8_t* data
	}, ; 45: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 49840, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_46; uint8_t* data
	}, ; 46: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 49312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_47; uint8_t* data
	}, ; 47: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 57504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_48; uint8_t* data
	}, ; 48: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 48288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_49; uint8_t* data
	}, ; 49: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 46240, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_50; uint8_t* data
	}, ; 50: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 46256, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_51; uint8_t* data
	}, ; 51: Microsoft.CodeAnalysis.Workspaces.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_52; uint8_t* data
	}, ; 52: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_53; uint8_t* data
	}, ; 53: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17584, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_54; uint8_t* data
	}, ; 54: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_55; uint8_t* data
	}, ; 55: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17584, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_56; uint8_t* data
	}, ; 56: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17584, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_57; uint8_t* data
	}, ; 57: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_58; uint8_t* data
	}, ; 58: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_59; uint8_t* data
	}, ; 59: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_60; uint8_t* data
	}, ; 60: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_61; uint8_t* data
	}, ; 61: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17584, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_62; uint8_t* data
	}, ; 62: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_63; uint8_t* data
	}, ; 63: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 17568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_64; uint8_t* data
	}, ; 64: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_65; uint8_t* data
	}, ; 65: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_66; uint8_t* data
	}, ; 66: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_67; uint8_t* data
	}, ; 67: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_68; uint8_t* data
	}, ; 68: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_69; uint8_t* data
	}, ; 69: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_70; uint8_t* data
	}, ; 70: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_71; uint8_t* data
	}, ; 71: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_72; uint8_t* data
	}, ; 72: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_73; uint8_t* data
	}, ; 73: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_74; uint8_t* data
	}, ; 74: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15640, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_75; uint8_t* data
	}, ; 75: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_76; uint8_t* data
	}, ; 76: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_77; uint8_t* data
	}, ; 77: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_78; uint8_t* data
	}, ; 78: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_79; uint8_t* data
	}, ; 79: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_80; uint8_t* data
	}, ; 80: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_81; uint8_t* data
	}, ; 81: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_82; uint8_t* data
	}, ; 82: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_83; uint8_t* data
	}, ; 83: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_84; uint8_t* data
	}, ; 84: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_85; uint8_t* data
	}, ; 85: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15640, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_86; uint8_t* data
	}, ; 86: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_87; uint8_t* data
	}, ; 87: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_88; uint8_t* data
	}, ; 88: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_89; uint8_t* data
	}, ; 89: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_90; uint8_t* data
	}, ; 90: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_91; uint8_t* data
	}, ; 91: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_92; uint8_t* data
	}, ; 92: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_93; uint8_t* data
	}, ; 93: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15640, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_94; uint8_t* data
	}, ; 94: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_95; uint8_t* data
	}, ; 95: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_96; uint8_t* data
	}, ; 96: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_97; uint8_t* data
	}, ; 97: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_98; uint8_t* data
	}, ; 98: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_99; uint8_t* data
	}, ; 99: _Microsoft.Android.Resource.Designer
	%struct.CompressedAssemblyDescriptor {
		i32 355944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_100; uint8_t* data
	}, ; 100: Humanizer
	%struct.CompressedAssemblyDescriptor {
		i32 238592, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_101; uint8_t* data
	}, ; 101: Microsoft.AspNetCore.Components
	%struct.CompressedAssemblyDescriptor {
		i32 30208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_102; uint8_t* data
	}, ; 102: Microsoft.AspNetCore.Components.Forms
	%struct.CompressedAssemblyDescriptor {
		i32 86528, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_103; uint8_t* data
	}, ; 103: Microsoft.AspNetCore.Components.Web
	%struct.CompressedAssemblyDescriptor {
		i32 162072, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_104; uint8_t* data
	}, ; 104: Microsoft.AspNetCore.Components.WebView
	%struct.CompressedAssemblyDescriptor {
		i32 71472, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_105; uint8_t* data
	}, ; 105: Microsoft.AspNetCore.Components.WebView.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 44576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_106; uint8_t* data
	}, ; 106: Microsoft.Build.Locator
	%struct.CompressedAssemblyDescriptor {
		i32 2895520, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_107; uint8_t* data
	}, ; 107: Microsoft.CodeAnalysis
	%struct.CompressedAssemblyDescriptor {
		i32 6501536, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_108; uint8_t* data
	}, ; 108: Microsoft.CodeAnalysis.CSharp
	%struct.CompressedAssemblyDescriptor {
		i32 883472, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_109; uint8_t* data
	}, ; 109: Microsoft.CodeAnalysis.CSharp.Workspaces
	%struct.CompressedAssemblyDescriptor {
		i32 3852448, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_110; uint8_t* data
	}, ; 110: Microsoft.CodeAnalysis.Workspaces
	%struct.CompressedAssemblyDescriptor {
		i32 86688, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_111; uint8_t* data
	}, ; 111: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost
	%struct.CompressedAssemblyDescriptor {
		i32 72864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_112; uint8_t* data
	}, ; 112: Microsoft.CodeAnalysis.Workspaces.MSBuild
	%struct.CompressedAssemblyDescriptor {
		i32 88064, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_113; uint8_t* data
	}, ; 113: Microsoft.Data.Sqlite
	%struct.CompressedAssemblyDescriptor {
		i32 2683432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_114; uint8_t* data
	}, ; 114: Microsoft.EntityFrameworkCore
	%struct.CompressedAssemblyDescriptor {
		i32 14848, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_115; uint8_t* data
	}, ; 115: Microsoft.EntityFrameworkCore.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 623160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_116; uint8_t* data
	}, ; 116: Microsoft.EntityFrameworkCore.Design
	%struct.CompressedAssemblyDescriptor {
		i32 2137136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_117; uint8_t* data
	}, ; 117: Microsoft.EntityFrameworkCore.Relational
	%struct.CompressedAssemblyDescriptor {
		i32 294968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_118; uint8_t* data
	}, ; 118: Microsoft.EntityFrameworkCore.Sqlite
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_119; uint8_t* data
	}, ; 119: Microsoft.Extensions.Caching.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 26112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_120; uint8_t* data
	}, ; 120: Microsoft.Extensions.Caching.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_121; uint8_t* data
	}, ; 121: Microsoft.Extensions.Configuration
	%struct.CompressedAssemblyDescriptor {
		i32 6656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_122; uint8_t* data
	}, ; 122: Microsoft.Extensions.Configuration.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 46592, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_123; uint8_t* data
	}, ; 123: Microsoft.Extensions.DependencyInjection
	%struct.CompressedAssemblyDescriptor {
		i32 33280, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_124; uint8_t* data
	}, ; 124: Microsoft.Extensions.DependencyInjection.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 42496, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_125; uint8_t* data
	}, ; 125: Microsoft.Extensions.DependencyModel
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_126; uint8_t* data
	}, ; 126: Microsoft.Extensions.FileProviders.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 7680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_127; uint8_t* data
	}, ; 127: Microsoft.Extensions.FileProviders.Composite
	%struct.CompressedAssemblyDescriptor {
		i32 18432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_128; uint8_t* data
	}, ; 128: Microsoft.Extensions.FileProviders.Embedded
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_129; uint8_t* data
	}, ; 129: Microsoft.Extensions.FileProviders.Physical
	%struct.CompressedAssemblyDescriptor {
		i32 26624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_130; uint8_t* data
	}, ; 130: Microsoft.Extensions.FileSystemGlobbing
	%struct.CompressedAssemblyDescriptor {
		i32 20480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_131; uint8_t* data
	}, ; 131: Microsoft.Extensions.Logging
	%struct.CompressedAssemblyDescriptor {
		i32 38912, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_132; uint8_t* data
	}, ; 132: Microsoft.Extensions.Logging.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 17408, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_133; uint8_t* data
	}, ; 133: Microsoft.Extensions.Options
	%struct.CompressedAssemblyDescriptor {
		i32 13824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_134; uint8_t* data
	}, ; 134: Microsoft.Extensions.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 40960, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_135; uint8_t* data
	}, ; 135: Microsoft.JSInterop
	%struct.CompressedAssemblyDescriptor {
		i32 1871112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_136; uint8_t* data
	}, ; 136: Microsoft.Maui.Controls
	%struct.CompressedAssemblyDescriptor {
		i32 128264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_137; uint8_t* data
	}, ; 137: Microsoft.Maui.Controls.Xaml
	%struct.CompressedAssemblyDescriptor {
		i32 800024, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_138; uint8_t* data
	}, ; 138: Microsoft.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 65024, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_139; uint8_t* data
	}, ; 139: Microsoft.Maui.Essentials
	%struct.CompressedAssemblyDescriptor {
		i32 207656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_140; uint8_t* data
	}, ; 140: Microsoft.Maui.Graphics
	%struct.CompressedAssemblyDescriptor {
		i32 177664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_141; uint8_t* data
	}, ; 141: Mono.TextTemplating
	%struct.CompressedAssemblyDescriptor {
		i32 423424, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_142; uint8_t* data
	}, ; 142: SkiaSharp
	%struct.CompressedAssemblyDescriptor {
		i32 42496, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_143; uint8_t* data
	}, ; 143: SkiaSharp.Views.Android
	%struct.CompressedAssemblyDescriptor {
		i32 29728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_144; uint8_t* data
	}, ; 144: SkiaSharp.Views.Maui.Controls
	%struct.CompressedAssemblyDescriptor {
		i32 30760, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_145; uint8_t* data
	}, ; 145: SkiaSharp.Views.Maui.Core
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_146; uint8_t* data
	}, ; 146: SQLitePCLRaw.batteries_v2
	%struct.CompressedAssemblyDescriptor {
		i32 51200, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_147; uint8_t* data
	}, ; 147: SQLitePCLRaw.core
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_148; uint8_t* data
	}, ; 148: SQLitePCLRaw.lib.e_sqlite3.android
	%struct.CompressedAssemblyDescriptor {
		i32 36864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_149; uint8_t* data
	}, ; 149: SQLitePCLRaw.provider.e_sqlite3
	%struct.CompressedAssemblyDescriptor {
		i32 184944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_150; uint8_t* data
	}, ; 150: System.CodeDom
	%struct.CompressedAssemblyDescriptor {
		i32 8704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_151; uint8_t* data
	}, ; 151: System.Composition.AttributedModel
	%struct.CompressedAssemblyDescriptor {
		i32 53880, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_152; uint8_t* data
	}, ; 152: System.Composition.Convention
	%struct.CompressedAssemblyDescriptor {
		i32 55440, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_153; uint8_t* data
	}, ; 153: System.Composition.Hosting
	%struct.CompressedAssemblyDescriptor {
		i32 10752, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_154; uint8_t* data
	}, ; 154: System.Composition.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 65168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_155; uint8_t* data
	}, ; 155: System.Composition.TypedParts
	%struct.CompressedAssemblyDescriptor {
		i32 59392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_156; uint8_t* data
	}, ; 156: Xamarin.AndroidX.Activity
	%struct.CompressedAssemblyDescriptor {
		i32 515584, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_157; uint8_t* data
	}, ; 157: Xamarin.AndroidX.AppCompat
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_158; uint8_t* data
	}, ; 158: Xamarin.AndroidX.AppCompat.AppCompatResources
	%struct.CompressedAssemblyDescriptor {
		i32 16384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_159; uint8_t* data
	}, ; 159: Xamarin.AndroidX.CardView
	%struct.CompressedAssemblyDescriptor {
		i32 19456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_160; uint8_t* data
	}, ; 160: Xamarin.AndroidX.Collection.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 71680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_161; uint8_t* data
	}, ; 161: Xamarin.AndroidX.CoordinatorLayout
	%struct.CompressedAssemblyDescriptor {
		i32 740352, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_162; uint8_t* data
	}, ; 162: Xamarin.AndroidX.Core
	%struct.CompressedAssemblyDescriptor {
		i32 24576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_163; uint8_t* data
	}, ; 163: Xamarin.AndroidX.CursorAdapter
	%struct.CompressedAssemblyDescriptor {
		i32 9728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_164; uint8_t* data
	}, ; 164: Xamarin.AndroidX.CustomView
	%struct.CompressedAssemblyDescriptor {
		i32 42496, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_165; uint8_t* data
	}, ; 165: Xamarin.AndroidX.DrawerLayout
	%struct.CompressedAssemblyDescriptor {
		i32 209920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_166; uint8_t* data
	}, ; 166: Xamarin.AndroidX.Fragment
	%struct.CompressedAssemblyDescriptor {
		i32 21504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_167; uint8_t* data
	}, ; 167: Xamarin.AndroidX.Lifecycle.Common.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 17408, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_168; uint8_t* data
	}, ; 168: Xamarin.AndroidX.Lifecycle.LiveData.Core
	%struct.CompressedAssemblyDescriptor {
		i32 32256, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_169; uint8_t* data
	}, ; 169: Xamarin.AndroidX.Lifecycle.ViewModel.Android
	%struct.CompressedAssemblyDescriptor {
		i32 12800, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_170; uint8_t* data
	}, ; 170: Xamarin.AndroidX.Lifecycle.ViewModelSavedState
	%struct.CompressedAssemblyDescriptor {
		i32 36352, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_171; uint8_t* data
	}, ; 171: Xamarin.AndroidX.Loader
	%struct.CompressedAssemblyDescriptor {
		i32 90112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_172; uint8_t* data
	}, ; 172: Xamarin.AndroidX.Navigation.Common
	%struct.CompressedAssemblyDescriptor {
		i32 18432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_173; uint8_t* data
	}, ; 173: Xamarin.AndroidX.Navigation.Fragment
	%struct.CompressedAssemblyDescriptor {
		i32 58880, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_174; uint8_t* data
	}, ; 174: Xamarin.AndroidX.Navigation.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 28160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_175; uint8_t* data
	}, ; 175: Xamarin.AndroidX.Navigation.UI
	%struct.CompressedAssemblyDescriptor {
		i32 405504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_176; uint8_t* data
	}, ; 176: Xamarin.AndroidX.RecyclerView
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_177; uint8_t* data
	}, ; 177: Xamarin.AndroidX.SavedState
	%struct.CompressedAssemblyDescriptor {
		i32 37888, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_178; uint8_t* data
	}, ; 178: Xamarin.AndroidX.SwipeRefreshLayout
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_179; uint8_t* data
	}, ; 179: Xamarin.AndroidX.VersionedParcelable
	%struct.CompressedAssemblyDescriptor {
		i32 57344, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_180; uint8_t* data
	}, ; 180: Xamarin.AndroidX.ViewPager
	%struct.CompressedAssemblyDescriptor {
		i32 38400, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_181; uint8_t* data
	}, ; 181: Xamarin.AndroidX.ViewPager2
	%struct.CompressedAssemblyDescriptor {
		i32 583168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_182; uint8_t* data
	}, ; 182: Xamarin.Google.Android.Material
	%struct.CompressedAssemblyDescriptor {
		i32 86016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_183; uint8_t* data
	}, ; 183: Xamarin.Kotlin.StdLib
	%struct.CompressedAssemblyDescriptor {
		i32 18432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_184; uint8_t* data
	}, ; 184: Xamarin.KotlinX.Coroutines.Core.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 89600, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_185; uint8_t* data
	}, ; 185: Xamarin.KotlinX.Serialization.Core.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 258048, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_186; uint8_t* data
	}, ; 186: SABES
	%struct.CompressedAssemblyDescriptor {
		i32 225280, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_187; uint8_t* data
	}, ; 187: Microsoft.CSharp
	%struct.CompressedAssemblyDescriptor {
		i32 34304, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_188; uint8_t* data
	}, ; 188: System.Collections.Concurrent
	%struct.CompressedAssemblyDescriptor {
		i32 175104, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_189; uint8_t* data
	}, ; 189: System.Collections.Immutable
	%struct.CompressedAssemblyDescriptor {
		i32 17920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_190; uint8_t* data
	}, ; 190: System.Collections.NonGeneric
	%struct.CompressedAssemblyDescriptor {
		i32 21504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_191; uint8_t* data
	}, ; 191: System.Collections.Specialized
	%struct.CompressedAssemblyDescriptor {
		i32 79360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_192; uint8_t* data
	}, ; 192: System.Collections
	%struct.CompressedAssemblyDescriptor {
		i32 27648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_193; uint8_t* data
	}, ; 193: System.ComponentModel.Annotations
	%struct.CompressedAssemblyDescriptor {
		i32 15360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_194; uint8_t* data
	}, ; 194: System.ComponentModel.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 151552, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_195; uint8_t* data
	}, ; 195: System.ComponentModel.TypeConverter
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_196; uint8_t* data
	}, ; 196: System.ComponentModel
	%struct.CompressedAssemblyDescriptor {
		i32 13312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_197; uint8_t* data
	}, ; 197: System.Console
	%struct.CompressedAssemblyDescriptor {
		i32 566784, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_198; uint8_t* data
	}, ; 198: System.Data.Common
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_199; uint8_t* data
	}, ; 199: System.Diagnostics.Contracts
	%struct.CompressedAssemblyDescriptor {
		i32 27136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_200; uint8_t* data
	}, ; 200: System.Diagnostics.DiagnosticSource
	%struct.CompressedAssemblyDescriptor {
		i32 15360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_201; uint8_t* data
	}, ; 201: System.Diagnostics.FileVersionInfo
	%struct.CompressedAssemblyDescriptor {
		i32 65024, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_202; uint8_t* data
	}, ; 202: System.Diagnostics.Process
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_203; uint8_t* data
	}, ; 203: System.Diagnostics.StackTrace
	%struct.CompressedAssemblyDescriptor {
		i32 15360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_204; uint8_t* data
	}, ; 204: System.Diagnostics.TraceSource
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_205; uint8_t* data
	}, ; 205: System.Diagnostics.Tracing
	%struct.CompressedAssemblyDescriptor {
		i32 37376, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_206; uint8_t* data
	}, ; 206: System.Drawing.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_207; uint8_t* data
	}, ; 207: System.Drawing
	%struct.CompressedAssemblyDescriptor {
		i32 59904, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_208; uint8_t* data
	}, ; 208: System.Formats.Asn1
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_209; uint8_t* data
	}, ; 209: System.Globalization
	%struct.CompressedAssemblyDescriptor {
		i32 22016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_210; uint8_t* data
	}, ; 210: System.IO.Compression.Brotli
	%struct.CompressedAssemblyDescriptor {
		i32 32256, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_211; uint8_t* data
	}, ; 211: System.IO.Compression
	%struct.CompressedAssemblyDescriptor {
		i32 30720, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_212; uint8_t* data
	}, ; 212: System.IO.FileSystem.Watcher
	%struct.CompressedAssemblyDescriptor {
		i32 26624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_213; uint8_t* data
	}, ; 213: System.IO.MemoryMappedFiles
	%struct.CompressedAssemblyDescriptor {
		i32 27136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_214; uint8_t* data
	}, ; 214: System.IO.Pipelines
	%struct.CompressedAssemblyDescriptor {
		i32 22528, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_215; uint8_t* data
	}, ; 215: System.IO.Pipes
	%struct.CompressedAssemblyDescriptor {
		i32 463360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_216; uint8_t* data
	}, ; 216: System.Linq.Expressions
	%struct.CompressedAssemblyDescriptor {
		i32 53248, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_217; uint8_t* data
	}, ; 217: System.Linq.Queryable
	%struct.CompressedAssemblyDescriptor {
		i32 128000, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_218; uint8_t* data
	}, ; 218: System.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 18432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_219; uint8_t* data
	}, ; 219: System.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 135168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_220; uint8_t* data
	}, ; 220: System.Net.Http
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_221; uint8_t* data
	}, ; 221: System.Net.NetworkInformation
	%struct.CompressedAssemblyDescriptor {
		i32 64512, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_222; uint8_t* data
	}, ; 222: System.Net.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 7680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_223; uint8_t* data
	}, ; 223: System.Net.Requests
	%struct.CompressedAssemblyDescriptor {
		i32 74240, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_224; uint8_t* data
	}, ; 224: System.Net.Sockets
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_225; uint8_t* data
	}, ; 225: System.Numerics.Vectors
	%struct.CompressedAssemblyDescriptor {
		i32 18432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_226; uint8_t* data
	}, ; 226: System.ObjectModel
	%struct.CompressedAssemblyDescriptor {
		i32 71680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_227; uint8_t* data
	}, ; 227: System.Private.Uri
	%struct.CompressedAssemblyDescriptor {
		i32 57344, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_228; uint8_t* data
	}, ; 228: System.Private.Xml.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 1448960, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_229; uint8_t* data
	}, ; 229: System.Private.Xml
	%struct.CompressedAssemblyDescriptor {
		i32 286208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_230; uint8_t* data
	}, ; 230: System.Reflection.Metadata
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_231; uint8_t* data
	}, ; 231: System.Reflection.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_232; uint8_t* data
	}, ; 232: System.Runtime.InteropServices.RuntimeInformation
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_233; uint8_t* data
	}, ; 233: System.Runtime.InteropServices
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_234; uint8_t* data
	}, ; 234: System.Runtime.Loader
	%struct.CompressedAssemblyDescriptor {
		i32 101888, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_235; uint8_t* data
	}, ; 235: System.Runtime.Numerics
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_236; uint8_t* data
	}, ; 236: System.Runtime.Serialization.Formatters
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_237; uint8_t* data
	}, ; 237: System.Runtime.Serialization.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_238; uint8_t* data
	}, ; 238: System.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 131584, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_239; uint8_t* data
	}, ; 239: System.Security.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 699904, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_240; uint8_t* data
	}, ; 240: System.Text.Encoding.CodePages
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_241; uint8_t* data
	}, ; 241: System.Text.Encoding.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 34304, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_242; uint8_t* data
	}, ; 242: System.Text.Encodings.Web
	%struct.CompressedAssemblyDescriptor {
		i32 369664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_243; uint8_t* data
	}, ; 243: System.Text.Json
	%struct.CompressedAssemblyDescriptor {
		i32 322560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_244; uint8_t* data
	}, ; 244: System.Text.RegularExpressions
	%struct.CompressedAssemblyDescriptor {
		i32 23552, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_245; uint8_t* data
	}, ; 245: System.Threading.Channels
	%struct.CompressedAssemblyDescriptor {
		i32 15360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_246; uint8_t* data
	}, ; 246: System.Threading.Tasks.Parallel
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_247; uint8_t* data
	}, ; 247: System.Threading.Thread
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_248; uint8_t* data
	}, ; 248: System.Threading.ThreadPool
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_249; uint8_t* data
	}, ; 249: System.Threading
	%struct.CompressedAssemblyDescriptor {
		i32 41984, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_250; uint8_t* data
	}, ; 250: System.Transactions.Local
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_251; uint8_t* data
	}, ; 251: System.Web.HttpUtility
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_252; uint8_t* data
	}, ; 252: System.Xml.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_253; uint8_t* data
	}, ; 253: System.Xml.ReaderWriter
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_254; uint8_t* data
	}, ; 254: System.Xml.XDocument
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_255; uint8_t* data
	}, ; 255: System.Xml.XPath.XDocument
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_256; uint8_t* data
	}, ; 256: System.Xml.XPath
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_257; uint8_t* data
	}, ; 257: System
	%struct.CompressedAssemblyDescriptor {
		i32 6656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_258; uint8_t* data
	}, ; 258: netstandard
	%struct.CompressedAssemblyDescriptor {
		i32 2586624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_259; uint8_t* data
	}, ; 259: System.Private.CoreLib
	%struct.CompressedAssemblyDescriptor {
		i32 166912, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_260; uint8_t* data
	}, ; 260: Java.Interop
	%struct.CompressedAssemblyDescriptor {
		i32 18984, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_261; uint8_t* data
	}, ; 261: Mono.Android.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 2043392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_262; uint8_t* data
	} ; 262: Mono.Android
], align 8

@__compressedAssemblyData_0 = internal dso_local global [46752 x i8] zeroinitializer, align 1
@__compressedAssemblyData_1 = internal dso_local global [48304 x i8] zeroinitializer, align 1
@__compressedAssemblyData_2 = internal dso_local global [48304 x i8] zeroinitializer, align 1
@__compressedAssemblyData_3 = internal dso_local global [48800 x i8] zeroinitializer, align 1
@__compressedAssemblyData_4 = internal dso_local global [48800 x i8] zeroinitializer, align 1
@__compressedAssemblyData_5 = internal dso_local global [51872 x i8] zeroinitializer, align 1
@__compressedAssemblyData_6 = internal dso_local global [48800 x i8] zeroinitializer, align 1
@__compressedAssemblyData_7 = internal dso_local global [48816 x i8] zeroinitializer, align 1
@__compressedAssemblyData_8 = internal dso_local global [47264 x i8] zeroinitializer, align 1
@__compressedAssemblyData_9 = internal dso_local global [58528 x i8] zeroinitializer, align 1
@__compressedAssemblyData_10 = internal dso_local global [46752 x i8] zeroinitializer, align 1
@__compressedAssemblyData_11 = internal dso_local global [43680 x i8] zeroinitializer, align 1
@__compressedAssemblyData_12 = internal dso_local global [44192 x i8] zeroinitializer, align 1
@__compressedAssemblyData_13 = internal dso_local global [421552 x i8] zeroinitializer, align 1
@__compressedAssemblyData_14 = internal dso_local global [450208 x i8] zeroinitializer, align 1
@__compressedAssemblyData_15 = internal dso_local global [440480 x i8] zeroinitializer, align 1
@__compressedAssemblyData_16 = internal dso_local global [451232 x i8] zeroinitializer, align 1
@__compressedAssemblyData_17 = internal dso_local global [447240 x i8] zeroinitializer, align 1
@__compressedAssemblyData_18 = internal dso_local global [492704 x i8] zeroinitializer, align 1
@__compressedAssemblyData_19 = internal dso_local global [452272 x i8] zeroinitializer, align 1
@__compressedAssemblyData_20 = internal dso_local global [453280 x i8] zeroinitializer, align 1
@__compressedAssemblyData_21 = internal dso_local global [432800 x i8] zeroinitializer, align 1
@__compressedAssemblyData_22 = internal dso_local global [595104 x i8] zeroinitializer, align 1
@__compressedAssemblyData_23 = internal dso_local global [429216 x i8] zeroinitializer, align 1
@__compressedAssemblyData_24 = internal dso_local global [382128 x i8] zeroinitializer, align 1
@__compressedAssemblyData_25 = internal dso_local global [381600 x i8] zeroinitializer, align 1
@__compressedAssemblyData_26 = internal dso_local global [18080 x i8] zeroinitializer, align 1
@__compressedAssemblyData_27 = internal dso_local global [18080 x i8] zeroinitializer, align 1
@__compressedAssemblyData_28 = internal dso_local global [18080 x i8] zeroinitializer, align 1
@__compressedAssemblyData_29 = internal dso_local global [18192 x i8] zeroinitializer, align 1
@__compressedAssemblyData_30 = internal dso_local global [18096 x i8] zeroinitializer, align 1
@__compressedAssemblyData_31 = internal dso_local global [18096 x i8] zeroinitializer, align 1
@__compressedAssemblyData_32 = internal dso_local global [18192 x i8] zeroinitializer, align 1
@__compressedAssemblyData_33 = internal dso_local global [18208 x i8] zeroinitializer, align 1
@__compressedAssemblyData_34 = internal dso_local global [18096 x i8] zeroinitializer, align 1
@__compressedAssemblyData_35 = internal dso_local global [18704 x i8] zeroinitializer, align 1
@__compressedAssemblyData_36 = internal dso_local global [18192 x i8] zeroinitializer, align 1
@__compressedAssemblyData_37 = internal dso_local global [18080 x i8] zeroinitializer, align 1
@__compressedAssemblyData_38 = internal dso_local global [18192 x i8] zeroinitializer, align 1
@__compressedAssemblyData_39 = internal dso_local global [48304 x i8] zeroinitializer, align 1
@__compressedAssemblyData_40 = internal dso_local global [49824 x i8] zeroinitializer, align 1
@__compressedAssemblyData_41 = internal dso_local global [49824 x i8] zeroinitializer, align 1
@__compressedAssemblyData_42 = internal dso_local global [50848 x i8] zeroinitializer, align 1
@__compressedAssemblyData_43 = internal dso_local global [50336 x i8] zeroinitializer, align 1
@__compressedAssemblyData_44 = internal dso_local global [53408 x i8] zeroinitializer, align 1
@__compressedAssemblyData_45 = internal dso_local global [50336 x i8] zeroinitializer, align 1
@__compressedAssemblyData_46 = internal dso_local global [49840 x i8] zeroinitializer, align 1
@__compressedAssemblyData_47 = internal dso_local global [49312 x i8] zeroinitializer, align 1
@__compressedAssemblyData_48 = internal dso_local global [57504 x i8] zeroinitializer, align 1
@__compressedAssemblyData_49 = internal dso_local global [48288 x i8] zeroinitializer, align 1
@__compressedAssemblyData_50 = internal dso_local global [46240 x i8] zeroinitializer, align 1
@__compressedAssemblyData_51 = internal dso_local global [46256 x i8] zeroinitializer, align 1
@__compressedAssemblyData_52 = internal dso_local global [17568 x i8] zeroinitializer, align 1
@__compressedAssemblyData_53 = internal dso_local global [17568 x i8] zeroinitializer, align 1
@__compressedAssemblyData_54 = internal dso_local global [17584 x i8] zeroinitializer, align 1
@__compressedAssemblyData_55 = internal dso_local global [17680 x i8] zeroinitializer, align 1
@__compressedAssemblyData_56 = internal dso_local global [17584 x i8] zeroinitializer, align 1
@__compressedAssemblyData_57 = internal dso_local global [17584 x i8] zeroinitializer, align 1
@__compressedAssemblyData_58 = internal dso_local global [17568 x i8] zeroinitializer, align 1
@__compressedAssemblyData_59 = internal dso_local global [17568 x i8] zeroinitializer, align 1
@__compressedAssemblyData_60 = internal dso_local global [17568 x i8] zeroinitializer, align 1
@__compressedAssemblyData_61 = internal dso_local global [17568 x i8] zeroinitializer, align 1
@__compressedAssemblyData_62 = internal dso_local global [17584 x i8] zeroinitializer, align 1
@__compressedAssemblyData_63 = internal dso_local global [17568 x i8] zeroinitializer, align 1
@__compressedAssemblyData_64 = internal dso_local global [17568 x i8] zeroinitializer, align 1
@__compressedAssemblyData_65 = internal dso_local global [15656 x i8] zeroinitializer, align 1
@__compressedAssemblyData_66 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_67 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_68 = internal dso_local global [15632 x i8] zeroinitializer, align 1
@__compressedAssemblyData_69 = internal dso_local global [15656 x i8] zeroinitializer, align 1
@__compressedAssemblyData_70 = internal dso_local global [15632 x i8] zeroinitializer, align 1
@__compressedAssemblyData_71 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_72 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_73 = internal dso_local global [15632 x i8] zeroinitializer, align 1
@__compressedAssemblyData_74 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_75 = internal dso_local global [15640 x i8] zeroinitializer, align 1
@__compressedAssemblyData_76 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_77 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_78 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_79 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_80 = internal dso_local global [15656 x i8] zeroinitializer, align 1
@__compressedAssemblyData_81 = internal dso_local global [15656 x i8] zeroinitializer, align 1
@__compressedAssemblyData_82 = internal dso_local global [15656 x i8] zeroinitializer, align 1
@__compressedAssemblyData_83 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_84 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_85 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_86 = internal dso_local global [15640 x i8] zeroinitializer, align 1
@__compressedAssemblyData_87 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_88 = internal dso_local global [15648 x i8] zeroinitializer, align 1
@__compressedAssemblyData_89 = internal dso_local global [15656 x i8] zeroinitializer, align 1
@__compressedAssemblyData_90 = internal dso_local global [15632 x i8] zeroinitializer, align 1
@__compressedAssemblyData_91 = internal dso_local global [15656 x i8] zeroinitializer, align 1
@__compressedAssemblyData_92 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_93 = internal dso_local global [15632 x i8] zeroinitializer, align 1
@__compressedAssemblyData_94 = internal dso_local global [15640 x i8] zeroinitializer, align 1
@__compressedAssemblyData_95 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_96 = internal dso_local global [15632 x i8] zeroinitializer, align 1
@__compressedAssemblyData_97 = internal dso_local global [15624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_98 = internal dso_local global [15672 x i8] zeroinitializer, align 1
@__compressedAssemblyData_99 = internal dso_local global [6144 x i8] zeroinitializer, align 1
@__compressedAssemblyData_100 = internal dso_local global [355944 x i8] zeroinitializer, align 1
@__compressedAssemblyData_101 = internal dso_local global [238592 x i8] zeroinitializer, align 1
@__compressedAssemblyData_102 = internal dso_local global [30208 x i8] zeroinitializer, align 1
@__compressedAssemblyData_103 = internal dso_local global [86528 x i8] zeroinitializer, align 1
@__compressedAssemblyData_104 = internal dso_local global [162072 x i8] zeroinitializer, align 1
@__compressedAssemblyData_105 = internal dso_local global [71472 x i8] zeroinitializer, align 1
@__compressedAssemblyData_106 = internal dso_local global [44576 x i8] zeroinitializer, align 1
@__compressedAssemblyData_107 = internal dso_local global [2895520 x i8] zeroinitializer, align 1
@__compressedAssemblyData_108 = internal dso_local global [6501536 x i8] zeroinitializer, align 1
@__compressedAssemblyData_109 = internal dso_local global [883472 x i8] zeroinitializer, align 1
@__compressedAssemblyData_110 = internal dso_local global [3852448 x i8] zeroinitializer, align 1
@__compressedAssemblyData_111 = internal dso_local global [86688 x i8] zeroinitializer, align 1
@__compressedAssemblyData_112 = internal dso_local global [72864 x i8] zeroinitializer, align 1
@__compressedAssemblyData_113 = internal dso_local global [88064 x i8] zeroinitializer, align 1
@__compressedAssemblyData_114 = internal dso_local global [2683432 x i8] zeroinitializer, align 1
@__compressedAssemblyData_115 = internal dso_local global [14848 x i8] zeroinitializer, align 1
@__compressedAssemblyData_116 = internal dso_local global [623160 x i8] zeroinitializer, align 1
@__compressedAssemblyData_117 = internal dso_local global [2137136 x i8] zeroinitializer, align 1
@__compressedAssemblyData_118 = internal dso_local global [294968 x i8] zeroinitializer, align 1
@__compressedAssemblyData_119 = internal dso_local global [11264 x i8] zeroinitializer, align 1
@__compressedAssemblyData_120 = internal dso_local global [26112 x i8] zeroinitializer, align 1
@__compressedAssemblyData_121 = internal dso_local global [15872 x i8] zeroinitializer, align 1
@__compressedAssemblyData_122 = internal dso_local global [6656 x i8] zeroinitializer, align 1
@__compressedAssemblyData_123 = internal dso_local global [46592 x i8] zeroinitializer, align 1
@__compressedAssemblyData_124 = internal dso_local global [33280 x i8] zeroinitializer, align 1
@__compressedAssemblyData_125 = internal dso_local global [42496 x i8] zeroinitializer, align 1
@__compressedAssemblyData_126 = internal dso_local global [9216 x i8] zeroinitializer, align 1
@__compressedAssemblyData_127 = internal dso_local global [7680 x i8] zeroinitializer, align 1
@__compressedAssemblyData_128 = internal dso_local global [18432 x i8] zeroinitializer, align 1
@__compressedAssemblyData_129 = internal dso_local global [19968 x i8] zeroinitializer, align 1
@__compressedAssemblyData_130 = internal dso_local global [26624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_131 = internal dso_local global [20480 x i8] zeroinitializer, align 1
@__compressedAssemblyData_132 = internal dso_local global [38912 x i8] zeroinitializer, align 1
@__compressedAssemblyData_133 = internal dso_local global [17408 x i8] zeroinitializer, align 1
@__compressedAssemblyData_134 = internal dso_local global [13824 x i8] zeroinitializer, align 1
@__compressedAssemblyData_135 = internal dso_local global [40960 x i8] zeroinitializer, align 1
@__compressedAssemblyData_136 = internal dso_local global [1871112 x i8] zeroinitializer, align 1
@__compressedAssemblyData_137 = internal dso_local global [128264 x i8] zeroinitializer, align 1
@__compressedAssemblyData_138 = internal dso_local global [800024 x i8] zeroinitializer, align 1
@__compressedAssemblyData_139 = internal dso_local global [65024 x i8] zeroinitializer, align 1
@__compressedAssemblyData_140 = internal dso_local global [207656 x i8] zeroinitializer, align 1
@__compressedAssemblyData_141 = internal dso_local global [177664 x i8] zeroinitializer, align 1
@__compressedAssemblyData_142 = internal dso_local global [423424 x i8] zeroinitializer, align 1
@__compressedAssemblyData_143 = internal dso_local global [42496 x i8] zeroinitializer, align 1
@__compressedAssemblyData_144 = internal dso_local global [29728 x i8] zeroinitializer, align 1
@__compressedAssemblyData_145 = internal dso_local global [30760 x i8] zeroinitializer, align 1
@__compressedAssemblyData_146 = internal dso_local global [5632 x i8] zeroinitializer, align 1
@__compressedAssemblyData_147 = internal dso_local global [51200 x i8] zeroinitializer, align 1
@__compressedAssemblyData_148 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_149 = internal dso_local global [36864 x i8] zeroinitializer, align 1
@__compressedAssemblyData_150 = internal dso_local global [184944 x i8] zeroinitializer, align 1
@__compressedAssemblyData_151 = internal dso_local global [8704 x i8] zeroinitializer, align 1
@__compressedAssemblyData_152 = internal dso_local global [53880 x i8] zeroinitializer, align 1
@__compressedAssemblyData_153 = internal dso_local global [55440 x i8] zeroinitializer, align 1
@__compressedAssemblyData_154 = internal dso_local global [10752 x i8] zeroinitializer, align 1
@__compressedAssemblyData_155 = internal dso_local global [65168 x i8] zeroinitializer, align 1
@__compressedAssemblyData_156 = internal dso_local global [59392 x i8] zeroinitializer, align 1
@__compressedAssemblyData_157 = internal dso_local global [515584 x i8] zeroinitializer, align 1
@__compressedAssemblyData_158 = internal dso_local global [15872 x i8] zeroinitializer, align 1
@__compressedAssemblyData_159 = internal dso_local global [16384 x i8] zeroinitializer, align 1
@__compressedAssemblyData_160 = internal dso_local global [19456 x i8] zeroinitializer, align 1
@__compressedAssemblyData_161 = internal dso_local global [71680 x i8] zeroinitializer, align 1
@__compressedAssemblyData_162 = internal dso_local global [740352 x i8] zeroinitializer, align 1
@__compressedAssemblyData_163 = internal dso_local global [24576 x i8] zeroinitializer, align 1
@__compressedAssemblyData_164 = internal dso_local global [9728 x i8] zeroinitializer, align 1
@__compressedAssemblyData_165 = internal dso_local global [42496 x i8] zeroinitializer, align 1
@__compressedAssemblyData_166 = internal dso_local global [209920 x i8] zeroinitializer, align 1
@__compressedAssemblyData_167 = internal dso_local global [21504 x i8] zeroinitializer, align 1
@__compressedAssemblyData_168 = internal dso_local global [17408 x i8] zeroinitializer, align 1
@__compressedAssemblyData_169 = internal dso_local global [32256 x i8] zeroinitializer, align 1
@__compressedAssemblyData_170 = internal dso_local global [12800 x i8] zeroinitializer, align 1
@__compressedAssemblyData_171 = internal dso_local global [36352 x i8] zeroinitializer, align 1
@__compressedAssemblyData_172 = internal dso_local global [90112 x i8] zeroinitializer, align 1
@__compressedAssemblyData_173 = internal dso_local global [18432 x i8] zeroinitializer, align 1
@__compressedAssemblyData_174 = internal dso_local global [58880 x i8] zeroinitializer, align 1
@__compressedAssemblyData_175 = internal dso_local global [28160 x i8] zeroinitializer, align 1
@__compressedAssemblyData_176 = internal dso_local global [405504 x i8] zeroinitializer, align 1
@__compressedAssemblyData_177 = internal dso_local global [11264 x i8] zeroinitializer, align 1
@__compressedAssemblyData_178 = internal dso_local global [37888 x i8] zeroinitializer, align 1
@__compressedAssemblyData_179 = internal dso_local global [9216 x i8] zeroinitializer, align 1
@__compressedAssemblyData_180 = internal dso_local global [57344 x i8] zeroinitializer, align 1
@__compressedAssemblyData_181 = internal dso_local global [38400 x i8] zeroinitializer, align 1
@__compressedAssemblyData_182 = internal dso_local global [583168 x i8] zeroinitializer, align 1
@__compressedAssemblyData_183 = internal dso_local global [86016 x i8] zeroinitializer, align 1
@__compressedAssemblyData_184 = internal dso_local global [18432 x i8] zeroinitializer, align 1
@__compressedAssemblyData_185 = internal dso_local global [89600 x i8] zeroinitializer, align 1
@__compressedAssemblyData_186 = internal dso_local global [258048 x i8] zeroinitializer, align 1
@__compressedAssemblyData_187 = internal dso_local global [225280 x i8] zeroinitializer, align 1
@__compressedAssemblyData_188 = internal dso_local global [34304 x i8] zeroinitializer, align 1
@__compressedAssemblyData_189 = internal dso_local global [175104 x i8] zeroinitializer, align 1
@__compressedAssemblyData_190 = internal dso_local global [17920 x i8] zeroinitializer, align 1
@__compressedAssemblyData_191 = internal dso_local global [21504 x i8] zeroinitializer, align 1
@__compressedAssemblyData_192 = internal dso_local global [79360 x i8] zeroinitializer, align 1
@__compressedAssemblyData_193 = internal dso_local global [27648 x i8] zeroinitializer, align 1
@__compressedAssemblyData_194 = internal dso_local global [15360 x i8] zeroinitializer, align 1
@__compressedAssemblyData_195 = internal dso_local global [151552 x i8] zeroinitializer, align 1
@__compressedAssemblyData_196 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_197 = internal dso_local global [13312 x i8] zeroinitializer, align 1
@__compressedAssemblyData_198 = internal dso_local global [566784 x i8] zeroinitializer, align 1
@__compressedAssemblyData_199 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_200 = internal dso_local global [27136 x i8] zeroinitializer, align 1
@__compressedAssemblyData_201 = internal dso_local global [15360 x i8] zeroinitializer, align 1
@__compressedAssemblyData_202 = internal dso_local global [65024 x i8] zeroinitializer, align 1
@__compressedAssemblyData_203 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_204 = internal dso_local global [15360 x i8] zeroinitializer, align 1
@__compressedAssemblyData_205 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_206 = internal dso_local global [37376 x i8] zeroinitializer, align 1
@__compressedAssemblyData_207 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_208 = internal dso_local global [59904 x i8] zeroinitializer, align 1
@__compressedAssemblyData_209 = internal dso_local global [4608 x i8] zeroinitializer, align 1
@__compressedAssemblyData_210 = internal dso_local global [22016 x i8] zeroinitializer, align 1
@__compressedAssemblyData_211 = internal dso_local global [32256 x i8] zeroinitializer, align 1
@__compressedAssemblyData_212 = internal dso_local global [30720 x i8] zeroinitializer, align 1
@__compressedAssemblyData_213 = internal dso_local global [26624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_214 = internal dso_local global [27136 x i8] zeroinitializer, align 1
@__compressedAssemblyData_215 = internal dso_local global [22528 x i8] zeroinitializer, align 1
@__compressedAssemblyData_216 = internal dso_local global [463360 x i8] zeroinitializer, align 1
@__compressedAssemblyData_217 = internal dso_local global [53248 x i8] zeroinitializer, align 1
@__compressedAssemblyData_218 = internal dso_local global [128000 x i8] zeroinitializer, align 1
@__compressedAssemblyData_219 = internal dso_local global [18432 x i8] zeroinitializer, align 1
@__compressedAssemblyData_220 = internal dso_local global [135168 x i8] zeroinitializer, align 1
@__compressedAssemblyData_221 = internal dso_local global [9216 x i8] zeroinitializer, align 1
@__compressedAssemblyData_222 = internal dso_local global [64512 x i8] zeroinitializer, align 1
@__compressedAssemblyData_223 = internal dso_local global [7680 x i8] zeroinitializer, align 1
@__compressedAssemblyData_224 = internal dso_local global [74240 x i8] zeroinitializer, align 1
@__compressedAssemblyData_225 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_226 = internal dso_local global [18432 x i8] zeroinitializer, align 1
@__compressedAssemblyData_227 = internal dso_local global [71680 x i8] zeroinitializer, align 1
@__compressedAssemblyData_228 = internal dso_local global [57344 x i8] zeroinitializer, align 1
@__compressedAssemblyData_229 = internal dso_local global [1448960 x i8] zeroinitializer, align 1
@__compressedAssemblyData_230 = internal dso_local global [286208 x i8] zeroinitializer, align 1
@__compressedAssemblyData_231 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_232 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_233 = internal dso_local global [7168 x i8] zeroinitializer, align 1
@__compressedAssemblyData_234 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_235 = internal dso_local global [101888 x i8] zeroinitializer, align 1
@__compressedAssemblyData_236 = internal dso_local global [7168 x i8] zeroinitializer, align 1
@__compressedAssemblyData_237 = internal dso_local global [6144 x i8] zeroinitializer, align 1
@__compressedAssemblyData_238 = internal dso_local global [19968 x i8] zeroinitializer, align 1
@__compressedAssemblyData_239 = internal dso_local global [131584 x i8] zeroinitializer, align 1
@__compressedAssemblyData_240 = internal dso_local global [699904 x i8] zeroinitializer, align 1
@__compressedAssemblyData_241 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_242 = internal dso_local global [34304 x i8] zeroinitializer, align 1
@__compressedAssemblyData_243 = internal dso_local global [369664 x i8] zeroinitializer, align 1
@__compressedAssemblyData_244 = internal dso_local global [322560 x i8] zeroinitializer, align 1
@__compressedAssemblyData_245 = internal dso_local global [23552 x i8] zeroinitializer, align 1
@__compressedAssemblyData_246 = internal dso_local global [15360 x i8] zeroinitializer, align 1
@__compressedAssemblyData_247 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_248 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_249 = internal dso_local global [12288 x i8] zeroinitializer, align 1
@__compressedAssemblyData_250 = internal dso_local global [41984 x i8] zeroinitializer, align 1
@__compressedAssemblyData_251 = internal dso_local global [11264 x i8] zeroinitializer, align 1
@__compressedAssemblyData_252 = internal dso_local global [4608 x i8] zeroinitializer, align 1
@__compressedAssemblyData_253 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_254 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_255 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_256 = internal dso_local global [5120 x i8] zeroinitializer, align 1
@__compressedAssemblyData_257 = internal dso_local global [4608 x i8] zeroinitializer, align 1
@__compressedAssemblyData_258 = internal dso_local global [6656 x i8] zeroinitializer, align 1
@__compressedAssemblyData_259 = internal dso_local global [2586624 x i8] zeroinitializer, align 1
@__compressedAssemblyData_260 = internal dso_local global [166912 x i8] zeroinitializer, align 1
@__compressedAssemblyData_261 = internal dso_local global [18984 x i8] zeroinitializer, align 1
@__compressedAssemblyData_262 = internal dso_local global [2043392 x i8] zeroinitializer, align 1

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ be1cab92326783479054e72990da08008e5be819"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
