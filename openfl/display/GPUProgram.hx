package openfl.display;
import flash.Lib;

class GPUProgram {

	public var ID(get, null):Int;
	public var vertexString:String;
	public var fragmentString:String;
	
	@:noCompletion public var __handle:Dynamic;
	
	public function new(vertexString:String, fragmentString:String) {
		__handle = lime_gpuprogram_create(Lib.current.stage.__handle, vertexString, fragmentString);
	}
	
	public static function use(program:GPUProgram) {
		if (program == null) {
			lime_gpuprogram_use(Lib.current.stage.__handle, null);
			return;
		}
		lime_gpuprogram_use(Lib.current.stage.__handle, program.__handle);
	}
	
	public function get_ID():Int {
		var id = lime_gpuprogram_get_id(__handle);
		if (id == null) {
			trace("NULL ID!!");
			return 0;
		}
		
		return id;
	}
	
	// Native Methods
	
	private static var lime_gpuprogram_create = Lib.load ("lime", "lime_gpuprogram_create", 3);
	private static var lime_gpuprogram_use = Lib.load ("lime", "lime_gpuprogram_use", 2);
	private static var lime_gpuprogram_get_id = Lib.load ("lime", "lime_gpuprogram_get_id", 1);
}