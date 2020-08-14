package path.flutter.flutterduanwu.flutter

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import io.flutter.embedding.android.FlutterFragment
import path.flutter.flutterduanwu.R

/**
 *
 * @ClassName: FlutetrFragmentDemo
 * @Description:
 * @Author: zb666
 * @CreateDate: 2020/7/15
 */
class FlutetrFragmentDemo: FlutterFragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return LayoutInflater.from(requireContext()).inflate(R.layout.fragmeng_demo,container);
    }

}
