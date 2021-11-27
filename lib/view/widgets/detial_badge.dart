import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './../../others/all.dart';

class DetailBadge extends StatefulWidget {
  final Size size;
  final int pid;
  final int price;
  const DetailBadge({
    Key? key,
    required this.size,
    required this.pid,
    required this.price,
  }) : super(key: key);

  @override
  State<DetailBadge> createState() => _DetailBadgeState();
}

class _DetailBadgeState extends State<DetailBadge> {
  final _bloc = CountBloc();
  final _cont = Get.put(GlobController());

  @override
  void initState() {
    bool _found = _cont.cartlist.any((p0) => p0.id == widget.pid);
    if (_found) {
      int _index =
          _cont.cartlist.indexWhere((element) => element.id == widget.pid);
      _bloc.statecountsink.add(_cont.cartlist[_index].count);
    }
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      padding: EdgeInsets.symmetric(
        vertical: 25,
        horizontal: widget.size.width * 0.06,
      ),
      decoration: const BoxDecoration(
        color: whit,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: txtcol,
            blurRadius: 20,
          ),
        ],
      ),
      child: StreamBuilder<int>(
        initialData: 0,
        stream: _bloc.statecountstream,
        builder: (context, snapshot) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  if (snapshot.data! == 1) {
                    _bloc.addbut(
                      (snapshot.data! - 1),
                      () {
                        _cont.deleteprodindb(widget.pid);
                      },
                    );
                  }
                  if (snapshot.data! > 1) {
                    _bloc.addbut(
                      (snapshot.data! - 1),
                      () {
                        _cont.addindb(
                          widget.pid,
                          (snapshot.data! - 1),
                          widget.price,
                        );
                      },
                    );
                  }
                },
                child: Icon(
                  Icons.remove_circle,
                  size: widget.size.width * 0.08,
                  color: redi,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                snapshot.data.toString(),
                style: TextStyle(
                  fontSize: widget.size.width * 0.07,
                  fontWeight: FontWeight.w600,
                  color: txtcol,
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  _bloc.addbut(
                    (snapshot.data! + 1),
                    () {
                      _cont.addindb(
                        widget.pid,
                        (snapshot.data! + 1),
                        widget.price,
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.add_circle,
                  size: widget.size.width * 0.08,
                  color: grn,
                ),
              ),
              Expanded(child: Container()),
              Text(
                "Total : ",
                style: TextStyle(
                  fontSize: widget.size.width * 0.045,
                  color: txtcol,
                ),
              ),
              Text(
                (widget.price * snapshot.data!).toString(),
                style: TextStyle(
                  fontSize: widget.size.width * 0.055,
                  fontWeight: FontWeight.bold,
                  color: txtcol,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
