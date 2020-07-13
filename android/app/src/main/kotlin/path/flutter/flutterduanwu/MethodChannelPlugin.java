package path.flutter.flutterduanwu;

import android.app.Activity;
import android.widget.Toast;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterView;

/**
 * @ClassName: MethodChannelPlugin
 * @Description:
 * @Author: zb666
 * @CreateDate: 2020-06-27
 */
public class MethodChannelPlugin implements MethodChannel.MethodCallHandler {

    private final Activity activity;

    public MethodChannelPlugin(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(FlutterView flutterView){
        MethodChannel methodChannel = new MethodChannel(flutterView,"startRecord");
        MethodChannelPlugin instance = new MethodChannelPlugin((Activity) flutterView.getContext());
        methodChannel.setMethodCallHandler(instance);


    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        switch (call.method) {
            case "showMethod":
                showToast(call.arguments());
                result.success("返回数据AAA");
                break;
            case "start":
                result.success("返回开始数据AAA");
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void showToast(String arguments) {
        Toast.makeText(activity,arguments,Toast.LENGTH_SHORT).show();
    }
}
